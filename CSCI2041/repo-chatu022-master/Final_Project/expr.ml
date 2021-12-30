type value 
  = Int of int
  | Bool of bool
  | Closure of string * expr * value_environment
  | Ref of value ref
  | PairV of value * value
  | ListV of value list

and value_environment = (string * value) list

and expr 
  = Val of value
  | Add of expr * expr
  | Sub of expr * expr
  | Mul of expr * expr
  | Div of expr * expr 
  | Lt  of expr * expr
  | Eq  of expr * expr
  | And of expr * expr
  | Not of expr
  | Let of string * typ * expr * expr
  | Id  of string
  | App of expr * expr
  | Lam of string * typ * expr
  | LetRec of string * typ * expr * expr
  | If of expr * expr * expr
  | Pair of expr * expr
  | Fst of expr
  | Snd of expr
  | Nil 
  | Cons of expr * expr
  | Head of expr
  | Tail of expr

and typ = Int_type 
        | Bool_type
        | Func_type of typ * typ
        | Pair_type of typ * typ
        | List_type of typ
        | Nil_type

type result
        = OK of typ
        | Errs of (expr * string) list
type type_environment = (string * typ option) list 


(* Part 1. Complete unparse *)

(* write_type: recursive helper method to avoid repetitively pattern matching for the functional expressions such as 
lambda, and let *)
let rec write_type (t : typ) : string =
  match t with
  | Int_type -> "int"
  | Bool_type -> "bool"
  | Func_type (x, y) -> write_type (x) ^ " -> " ^ write_type (y)
  | Pair_type (x, y) -> write_type (x) ^ " * " ^ write_type (y)
  | List_type (x) -> write_type (x) ^ " list"

let rec unparse (e: expr) : string =  match e with
  | Add (exp1,exp2) -> "(" ^ unparse exp1 ^ " + " ^ unparse exp2 ^ ")"
  | Sub (exp1,exp2) -> "(" ^ unparse exp1 ^ " - " ^ unparse exp2 ^ ")"
  | Mul (exp1,exp2) -> "(" ^ unparse exp1 ^ " * " ^ unparse exp2 ^ ")"
  | Div (exp1,exp2) -> "(" ^ unparse exp1 ^ " / " ^ unparse exp2 ^ ")"
  | Lt (exp1,exp2) -> "(" ^ unparse exp1 ^ " < " ^ unparse exp2 ^ ")"
  | Eq (exp1,exp2) -> "(" ^ unparse exp1 ^ " = " ^ unparse exp2 ^ ")"
  | And (exp1,exp2) -> "(" ^ unparse exp1 ^ " && " ^ unparse exp2 ^ ")"
  | Not (exp1) -> " !" ^ unparse exp1 
  (* For lam and let, I used my helper write_type to make sure I got the function part written correctly (eg: fun x -> int -> int) *)
  | App (exp1,exp2) -> "(" ^ unparse exp1 ^ " " ^ unparse exp2 ^ ")"
  | Lam (v, t, e) -> "(fun (" ^ v ^ ": " ^ write_type (t) ^ ") -> " ^ unparse e ^ ")"
  | Let (v, t, exp1, exp2) -> "let " ^ v ^ ": " ^ write_type (t) ^ " = " ^ unparse exp1 ^ " in " ^ unparse exp2
  | LetRec (v, t, exp1, exp2) -> "let rec " ^ v ^ ": " ^ write_type (t) ^ " = " ^ unparse exp1 ^ " in " ^ unparse exp2
  | If (p, q, r) -> "if " ^ unparse(p) ^ " then " ^ unparse (q) ^ " else " ^ unparse (r)
  | Id v -> v
  | Pair (exp1,exp2) -> "(" ^ unparse exp1 ^ "," ^ unparse exp2 ^ ")"
  | Fst exp1 -> unparse exp1
  | Snd exp2 -> unparse exp2
  | Nil -> "[]"
  | Cons (exp1,exp2) -> unparse exp1 ^ " :: " ^ unparse exp2
  | Head hd -> "List.hd " ^ unparse hd
  | Tail tl -> "List.tl " ^ unparse tl
  | Val v -> 
    (
      match v with
      | Int i -> string_of_int i
      | Bool b -> string_of_bool b
      | Closure (exp1, exp2, env) -> "fun"
      | Ref r -> "reference"
      | PairV (v1,v2) -> "(" ^ unparse (Val(v1)) ^ ", " ^ unparse (Val(v2)) ^ ")"
      | ListV vls -> (
                      let start = "["
                      in
                      let body = match vls with
                        | [] -> ""
                        | [v] -> unparse (Val(v))
                        | x::xs -> unparse (Val(x)) ^ "; " ^ unparse (Val(List.hd xs))
                      in
                      start^body^"]"
                      )
    )



(* Part 2. Complete freevars *)
let rec freevars (e: expr) : string list = 
  match e with
  | Val _ -> []
  | Add (exp1, exp2) | Sub (exp1, exp2) | Mul (exp1, exp2) | Div (exp1, exp2) | Lt (exp1, exp2) | Eq (exp1, exp2) | And (exp1, exp2) -> freevars exp1 @ freevars exp2
  | Not e -> freevars e
  | App (exp1, exp2) -> freevars exp1 @ freevars exp2
  | Lam (s, t, e) -> List.filter (fun x -> x <> s) (freevars e)
  | Let (s, t, exp1, exp2) -> freevars exp1 @ List.filter ( (<>) s ) (freevars exp2)
  | LetRec (s, t, exp1, exp2) -> List.filter (fun x -> x <> s) (freevars exp1) @ List.filter (fun x -> x <> s) (freevars exp2)
  | If (exp1, exp2, exp3) -> freevars exp1 @ freevars exp2 @ freevars exp3
  | Id x -> [x]
  | Pair (exp1, exp2) -> freevars exp1 @ freevars exp2
  | Fst exp1 -> freevars exp1
  | Snd exp2 -> freevars exp2
  | Nil -> []
  | Cons (exp1, exp2) -> freevars exp1 @ freevars exp2
  | Head hd -> freevars hd
  | Tail tl -> freevars tl

(* Part 3. Type Checking *)

let expect_Int (r: result) (e: expr) : (expr * string) list =
  match r with
  | OK Int_type -> []
  | OK Bool_type ->  [(e, "expected Int, got Bool") ]
  | Errs errs -> errs

let expect_Bool (r: result) (e: expr) : (expr * string) list =
  match r with
  | OK Bool_type -> []
  | OK Int_type ->  [(e, "expected Bool, got Int") ]
  | Errs errs -> errs

  (* look_up type given in Lecture *)
let rec lookup_typ (x: string)  (t_env: type_environment) : result =
  match t_env with
  | [] -> Errs ( [(Id x, "identifier not bound")] )
  | (y, Some ty)::ys -> if x = y then OK ty else lookup_typ x ys


let rec type_check (e: expr) (env: type_environment) : result =
  match e with
  | Nil -> OK Nil_type
  | Id x -> lookup_typ x env
  | Add (exp1, exp2) | Sub (exp1, exp2) | Mul (exp1, exp2) | Div (exp1, exp2) ->
                                ( 
                                  match type_check exp1 env, type_check exp2 env with
                                  | OK Int_type, OK Int_type -> OK Int_type
                                  | r1, r2 -> Errs (expect_Int r1 exp1 @ expect_Int r2 exp2)
                                )
  | Eq (exp1, exp2) -> 
                                ( 
                                  match type_check exp1 env, type_check exp2 env with
                                  | OK Int_type, OK Int_type -> OK Bool_type
                                  | OK _, OK Nil_type -> OK Bool_type
                                  | r1, r2 -> Errs (expect_Int r1 exp1 @ expect_Int r2 exp2)
                                )
  | Lt (exp1, exp2) ->
                                ( 
                                  match type_check exp1 env, type_check exp2 env with
                                  | OK Int_type, OK Int_type -> OK Bool_type
                                  | OK _, OK Nil_type -> OK Bool_type
                                  | r1, r2 -> Errs (expect_Int r1 exp1 @ expect_Int r2 exp2)
                                )
  | And (exp1, exp2) ->
                    ( 
                      match type_check exp1 env, type_check exp2 env with
                      | OK Bool_type, OK Bool_type -> OK Bool_type
                      | r1, r2 -> Errs (expect_Bool r1 exp1 @ expect_Bool r2 exp2)
                    )
  | Not (exp1) -> 
                ( 
                  match type_check exp1 env with
                  | OK Bool_type -> OK Bool_type
                  | r1 -> Errs (expect_Bool r1 exp1) 
                )
  | App (exp1,exp2) -> 
                      ( 
                        let check typ = 
                          match typ with 
                            | OK _  -> []
                            | Errs errs -> errs
                        in
                        match type_check exp1 env, type_check exp2 env with                           
                        | Errs errs , typ2 -> Errs (errs @ (check typ2)) 
                        | OK Func_type (typ1,typ2), OK typ -> if typ = typ1 then OK typ2 else Errs ([e, "Incompatible types"])
                        | OK _ , typ -> Errs ((exp1, "The expresions don't match")::(check typ))
                      )
  | Let (n, typ, exp1, exp2) ->
                              (
                                match type_check exp1 env with
                                | Errs errs -> Errs errs
                                | OK typ1 -> if typ = typ1 then type_check exp2 ((n,Some typ1)::env) else Errs ([(e, "Incompatible types")])
                              )
  | Lam (str, typ, exp1) -> 
                          (
                            let nenv = (str, Some typ)::env
                            in
                            match type_check exp1 nenv with 
                              | OK x -> OK (Func_type(typ, x))
                              | r1 -> r1
                          )
  | LetRec (x, typ, exp1, exp2) ->
                                  (
                                    let nenv = (x, Some typ)::env
                                    in
                                    match type_check exp1 nenv with
                                      | Errs errs -> Errs errs
                                      | OK typ1 -> if typ = typ1 then type_check exp2 ((x, Some typ1)::env) else Errs ([(e, "Incompatible types")])
                                  )
  | If (exp1,exp2,exp3) ->
                    (
                      match type_check exp1 env, type_check exp2 env, type_check exp3 env with
                      | OK Bool_type, OK Int_type, OK Int_type -> OK Int_type
                      | OK Bool_type, OK Bool_type, OK Bool_type -> OK Bool_type
                      | r1, OK Int_type, r3 -> OK Int_type
                      | r1, r2, r3 -> Errs([(e, "Incompatible types")])
                    )
  | Pair (exp1, exp2) -> 
                    (
                      match type_check exp1 env, type_check exp2 env with
                      | OK typ1, OK typ2 -> OK (Pair_type(typ1,typ2))
                      | r1, r2 -> Errs([(e, "Incompatible types")])
                    )
  | Cons (exp1, exp2) -> 
                    (
                      match type_check exp1 env, type_check exp2 env with
                        | OK typ, OK List_type (typ_1) -> if typ <> typ_1 then Errs([(exp2, "expected List type")]) else OK (List_type(typ)) 
                        | OK typ, OK Nil_type -> OK (List_type(typ))
                        | Errs er , OK _ -> Errs(er)
                        | OK _ , Errs er -> Errs(er)
                        | r1, r2 -> Errs([(e, "expected List type")])
                    )
  | Fst (exp1) -> 
                (
                  match type_check exp1 env with
                  | OK Pair_type(typ1,typ2) -> if typ1 <> typ2 then Errs ([e, "Incompatible types"]) else OK typ2
                  | r1 -> Errs([(e, "Incompatible types, Pair")])
                )
  | Snd (exp1)-> 
              (
                match type_check exp1 env with
                | OK Pair_type(typ1,typ2) -> if typ1 = typ2 then OK typ2 else Errs ([e, "Incompatible types"])
                | r1 -> Errs([(e, "Incompatible types, Pair")])
              )
  | Head (exp1) -> 
                (
                  match type_check exp1 env with
                    | OK (List_type(Int_type)) -> OK Int_type
                    | OK Int_type -> OK Int_type
                    | OK typ1 -> OK (typ1)
                    | Errs er -> Errs(er)
                )
  | Tail (exp1) -> 
                (
                  match type_check exp1 env with
                      | OK Int_type -> OK (List_type(Int_type))
                      | OK List_type(typ1) -> OK (List_type(typ1))
                      | Errs er -> Errs(er)
                )           
  | Val v -> 
              ( 
                match v with
                  | Int _ -> OK Int_type
                  | Bool _ -> OK Bool_type
                  | Closure _ -> failwith "N/A"
                  | Ref _ -> failwith "N/A"
                  | PairV (v1, v2) -> failwith "N/A"
                  | ListV v1 -> failwith "N/A"
              )
let check e = type_check e []

(* Part 4. Evaluation *)

(* 
  Lookup helper method: Adapted from Prof. EVW's notes, with a few notable changes 
  -> changed input parameter: we will use lookup in eval, which evaluates the expression based on our value_environment
  -> changed the (n', v) :: rest when n' -> n case to accomodate for pointers (Ref v), 
     in which case we dereference the pointer using the "!" operator 
  Used in eval to find value of variables under the pattern "Id x ->"
*)

let rec lookup (str: string) (env: value_environment) : value = 
  match env with
  | [] -> failwith ("The name " ^ str ^ " is not bound by a let.") (* If an empty list is given as the environment then fail *)
  | (str',v)::rest when str' = str -> 
    (
      match v with
        | Ref (v) -> !v 
        | _ -> v  
    )
  | (_,_)::xs -> lookup str xs

let rec eval (env: value_environment) (e:expr) : value =
 match e with 
  | Nil -> ListV([])
  | Val v ->  
            (
              match v with 
                | Closure (v, exp1, venv) -> eval venv exp1
                | x -> x
            )
 | Id n -> lookup n env
 | Add (exp1, exp2) -> 
                ( 
                  match eval env exp1, eval env exp2 with
                    | Int v1, Int v2 -> Int (v1 + v2)
                    | _ -> raise (Failure "incompatible types, Add")
                )
 | Sub (exp1, exp2) ->
                  ( 
                    match eval env exp1, eval env exp2 with
                      | Int v1, Int v2 -> Int (v1 - v2)
                      | _ -> raise (Failure "incompatible types, Sub")
                  )
 | Mul (exp1, exp2) ->
                  ( 
                    match eval env exp1, eval env exp2 with
                      | Int v1, Int v2 -> Int (v1 * v2)
                      | _ -> raise (Failure "incompatible types, Mul")
                  )
 | Div (exp1, exp2) ->
                  ( 
                    match eval env exp1, eval env exp2 with
                      | Int v1, Int v2 -> Int (v1 / v2)
                      | _ -> raise (Failure "incompatible types, Div")
                  )
 | Lt (exp1, exp2) -> 
                  ( 
                    match eval env exp1, eval env exp2 with
                      | Int v1, Int v2 -> Bool (v1 < v2)
                      | _ -> raise (Failure "Incompatible types, Lt")
                  )
 | Eq (exp1, exp2) -> 
                  ( 
                    match eval env exp1, eval env exp2 with
                      | Int v1, Int v2 -> Bool (v1 = v2)
                      | Bool v1, Bool v2 -> Bool (v1 = v2)
                      | ListV v1, ListV v2 -> Bool (v1 = v2)
                      | _ -> raise (Failure "Incompatible types, Eq")
                  )
 | And (exp1, exp2) -> 
                  ( 
                    match eval env exp1, eval env exp2 with
                      | Bool v1, Bool v2 -> Bool (v1 && v2)
                      | _ -> raise (Failure "Incompatible types, And")
                  )
 | Not (exp1) -> 
              ( 
                match eval env exp1 with
                  | Bool true -> Bool false
                  | Bool false -> Bool true
                  | _ -> raise (Failure "Incompatible types, Not")
              )
 | App (exp1, exp2) -> 
    let helper_func' = 
      match eval env exp1 with 
        | Ref v -> !v
        | v -> v
    in 
    (
      match helper_func' with 
        | Closure (str, exp, cenv) -> 
                                        (
                                          let new_env = (str, (eval env (exp2)))::cenv
                                          in
                                          eval new_env exp
                                        )
        | _ -> raise (Failure "incompatible types, App")
    )

  | Let (n, t, dexpr, body) -> 
    let v = eval env dexpr 
    in
    eval ((n,v)::env) body

 | LetRec (f, t, dexpr, body) -> 
       (
        match dexpr with 
          | Lam (n, t, exp) ->
                                (
                                let recRef = ref (Int 1024) 
                                in
                                let newEnv = (f, Ref recRef)::env 
                                in
                                let clos = Closure (n, exp, newEnv)
                                in
                                let () = recRef := clos in (eval ((f, clos)::env) (body))
                                )
          | _ -> raise (Failure "incompatible Types, LetRec")
       )
  | Lam (str, typ, exp1) ->
    (
    let rec helper_func (new_env: value_environment) (str: string)   = 
                (
                  match new_env with
                    | [] -> None 
                    | (str', v)::rest when str' = str -> Some v 
                    | (_)::rest -> helper_func rest str 
                )
    in    
    let val_def (free_v) = 
      match helper_func (env) (free_v) with
        | Some s -> (free_v, s)
        | None -> raise (Failure "This variable was not found.")
    in 
    let c_env = List.map (val_def)(freevars (e)) 
    in 
    Closure (str, exp1, c_env)
    )
  | If (p, q, r) -> 
                    (
                      (* If p, then q, else r *)
                      match eval env p with
                      | Bool true -> eval env q 
                      | Bool false -> eval env r
                      | _ -> raise (Failure ("Faulty If Statement: The if statement didn't evaluate to a boolean result."))
                    )

 | Pair (exp1, exp2) -> 
                      (
                        match eval env exp1, eval env exp2 with 
                          | r1, r2 -> PairV (r1, r2)                        
                      )
 | Fst (exp1) -> 
              (
                match eval env exp1 with 
                  | PairV (r1, r2) -> r1
                  | _ -> failwith "Error: Expected a Pair!"
              )
 | Snd (exp1) ->
              (
                match eval env exp1 with 
                  | PairV (r1, r2) -> r2
                  | _ -> failwith "Error: Expected a Pair!"
              )
 | Cons (exp1, exp2) ->
                      (
                        match eval env exp1, eval env exp2 with 
                          | r1, ListV (r2) -> ListV (r1::r2)
                          | r1, _ -> ListV ([r1])
                      )
 | Head (exp1) -> 
                (
                  match eval env exp1 with 
                    | ListV (hd::tl) -> hd
                    | _ -> failwith "Error: Expected a Pair!"
                )
 | Tail (exp1) ->
                (
                  match eval env exp1 with 
                    | ListV (_::tl) -> ListV(tl)
                    | _ -> failwith "Error: Expected a Pair!"
                )


let evaluate e = eval [] e

(* some sample expressions *)

let e1 = Add (Val (Int 3), Val (Int 5))
let e2 = Add (Val (Int 3), Val (Bool true))
let e3 = Mul (Val (Bool true), Val (Int 5))
let e4 = Add (e2, e3)

let e5 = Let ("x", Int_type, Add (Val (Int 3), Val (Int 4)),
              Add (Id "x", Val (Int 5))
           )
       
let e6 = Let ("x", Int_type, Add (Val (Int 3), Val (Int 4)),
              Lt (Id "x", Val (Int 5))
           )
       
(* ``let x = 3 < 5 in x && let x = 1 + 2 in x = 3 *)
let e7 = Let ("x", Bool_type,
              Lt (Val (Int 3), Val (Int 5)),
              And (Id "x",
                   Let ("x", Int_type,
                        Add (Val (Int 1), Val (Int 2)),
                        Eq (Id "x", Val (Int 3))
                       )
                  )
             )


(* ``let x = 3 < 5 in y && let x = 1 + 2 in x = 3 *)
let e8 = Let ("x", Bool_type,
              Lt (Val (Int 3), Val (Int 5)),
              And (Id "y",
                   Let ("x", Int_type,
                        Add (Val (Int 1), Val (Int 2)),
                        Eq (Id "x", Val (Int 3))
                       )
                  )
             )

let err_1 = Let ("x", Int_type, Add (Val (Int 3), Val (Int 4)),
                 And (Id "x", Val (Bool true))
              )

let err_2 = Let ("x", Int_type, Add (Id "x", Val (Int 4)),
                 And (Id "y", Val (Bool true))
              )

let inc_use = Let ("inc", Func_type (Int_type, Int_type), 
                   Lam ("n", Int_type, Add (Id "n", Val (Int 1))),
                   App (Id "inc", Val (Int 3))
                )

let sumToN : expr =
    LetRec ("sumToN", Func_type (Int_type, Int_type),
            Lam ("n", Int_type,
                 If (Eq (Id "n", Val (Int 0)),
                     Val (Int 0),
                     Add (Id "n",
                          App (Id "sumToN",
                               Sub (Id "n", Val (Int 1))
                              )
                         )
                    )
                ),
            Id "sumToN"
           )

let sumTo3 = App (sumToN, Val (Int 4))