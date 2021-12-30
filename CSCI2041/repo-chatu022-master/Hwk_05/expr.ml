(* Hwk 05.  Extend the construts below as specified.
 *)

type value 
  = Int of int
  | Bool of bool
  | Closure of string * expr * value_environment
  | Ref of value ref

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

and typ = Int_type 
        | Bool_type
        | Func_type of typ * typ

type type_environment = (string * typ option) list 


(* Part 1. Complete unparse *)

(* write_type: recursive helper method to avoid repetitively pattern matching for the functional expressions such as 
lambda, and let *)
let rec write_type (t : typ) : string =
  match t with
  | Int_type -> "int"
  | Bool_type -> "bool"
  | Func_type (x, y) -> write_type (x) ^ " -> " ^ write_type (y)

let rec unparse (e: expr) : string =  match e with
  | Add (e1,e2) -> "(" ^ unparse e1 ^ " + " ^ unparse e2 ^ ")"
  | Sub (e1,e2) -> "(" ^ unparse e1 ^ " - " ^ unparse e2 ^ ")"
  | Mul (e1,e2) -> "(" ^ unparse e1 ^ " * " ^ unparse e2 ^ ")"
  | Div (e1,e2) -> "(" ^ unparse e1 ^ " / " ^ unparse e2 ^ ")"
  | Lt (e1,e2) -> "(" ^ unparse e1 ^ " < " ^ unparse e2 ^ ")"
  | Eq (e1,e2) -> "(" ^ unparse e1 ^ " = " ^ unparse e2 ^ ")"
  | And (e1,e2) -> "(" ^ unparse e1 ^ " && " ^ unparse e2 ^ ")"
  | Not (e1) -> " !" ^ unparse e1 
  (* For lam and let, I used my helper write_type to make sure I got the function part written correctly (eg: fun x -> int -> int) *)
  | App (e1,e2) -> "(" ^ unparse e1 ^ " " ^ unparse e2 ^ ")"
  | Lam (v, t, e) -> "(fun (" ^ v ^ ": " ^ write_type (t) ^ ") -> " ^ unparse e ^ ")"
  | Let (v, t, e1, e2) -> "let " ^ v ^ ": " ^ write_type (t) ^ " = " ^ unparse e1 ^ " in " ^ unparse e2
  | LetRec (v, t, e1, e2) -> "let rec " ^ v ^ ": " ^ write_type (t) ^ " = " ^ unparse e1 ^ " in " ^ unparse e2
  | If (p, q, r) -> "if " ^ unparse(p) ^ " then " ^ unparse (q) ^ " else " ^ unparse (r)
  | Id v -> v
  | Val v -> 
    (
      match v with
      | Int i -> string_of_int i
      | Bool b -> string_of_bool b
      | Closure (e1, e2, env) -> "fun"
      | Ref r -> "reference"
    )



(* Part 2. Complete freevars *)
let rec freevars (e: expr) : string list = 
  match e with
  | Val _ -> []
  (* The function already has used variables if it is undergoing any operations, 
  so we just look deeper into each of the two expressions and combine the subsequent results. *)
  | Add (e1, e2) | Sub (e1, e2) | Mul (e1, e2) | Div (e1, e2) | Lt (e1, e2) | Eq (e1, e2) | And (e1, e2) -> freevars e1 @ freevars e2
  | Not e -> freevars e
  (* If we have gotten a variable that is unused, then by definition we put it within the string list we return. *)

  (* We are going to filter out any free variables in the second expression (since it's the one being evaluated by the first) 
     and then we are going to add that to our current list of free vars we have accumulated. *)
  | App (e1, e2) -> freevars e1 @ freevars e2
   (* We are going to filter out any free variables in the second expression (since it's the one being evaluated by the first) 
     and then we are going to add that to our current list of free vars we have accumulated. *)
  | Lam (s, t, e) -> 
      (
        match t with 
        (* We pass in a function (fun x -> x <> s) to find variables within the list that are not used, and therefore free. *)
        | Int_type | Bool_type -> List.filter (fun x -> x <> s) (freevars e)
        | _ -> ["Error, what you doing fam"]
      )
   (* For the recursive let however, we need to filter both expressions since both can contain free variables as the let rec uses
      recursion to pass in refreences. *)
    | Let (s, t, e1, e2) -> 
      (
        match t with 
        (* We pass in a function (fun x -> x <> s) to find variables within the list that are not used, and therefore free. *)
        | Int_type | Bool_type -> freevars e1 @ List.filter ( (<>) s ) (freevars e2)
        | _ -> ["Error, what you doing fam"]
      )
    | LetRec (s, t, e1, e2) -> 
      (
        match t with
        (* We pass in a function (fun x -> x <> s) to find variables within the list that are not used, and therefore free. *)
        | Int_type | Bool_type -> List.filter (fun x -> x <> s) (freevars e1) @
                      List.filter (fun x -> x <> s) (freevars e2)
        | _ -> ["Error, what you doing fam"]
      )
  (* For if statements, we need to evaluate each of the conditions for any free variables. *)
  | If (e1, e2, e3) -> freevars e1 @ freevars e2 @ freevars e3
  | Id x -> [x]


(* Part 4. Evaluation *)

(* 
  Lookup helper method: Adapted from Prof. EVW's notes, with a few notable changes 
  -> changed input parameter: we will use lookup in eval, which evaluates the expression based on our value_environment
  -> changed the (n', v) :: rest when n' -> n case to accomodate for pointers (Ref v), 
     in which case we dereference the pointer using the "!" operator 
  Used in eval to find value of variables under the pattern "Id x ->"
*)
let rec lookup (n: string) (env: value_environment) : value =
  match env with
  | [] -> failwith ("The name " ^ n ^ " is not bound by a let.")
  | (n',v) :: rest when n' = n -> 
    (
      match v with 
      | Ref v -> !v
      | v -> v
    )
  | (_,_) :: rest -> lookup n rest


let rec eval (env: value_environment) (e:expr) : value =
  match e with
  | Add (e1, e2) ->
     ( 
       match eval env e1, eval env e2 with
       | Int v1, Int v2 -> Int (v1 + v2)
       | _ -> raise (Failure "Type Error: The addition operator is only compatible with ints.")
     )
  | Sub (e1, e2) -> 
    ( 
      match eval env e1, eval env e2 with
      | Int i1, Int i2 -> Int (i1 - i2)
      | _, _ -> raise (Failure "Type Error: The subtraction operator is only compatible with ints.")
    )
  | Mul (e1, e2) -> 
    ( 
      match eval env e1, eval env e2 with
      | Int i1, Int i2 -> Int (i1 * i2)
      | _, _ -> raise (Failure "Type Error: The multiplication operator is only compatible with ints.")
    )
  | Div (e1, e2) -> 
    ( 
      match eval env e1, eval env e2 with
      | Int i1, Int i2 -> Int (i1 / i2)
      | _, _ -> raise (Failure "Type Error: The division operator is only compatible with ints.")
    ) 
  | Lt (e1, e2) -> 
    ( 
      match eval env e1, eval env e2 with
      | Int i1, Int i2 -> Bool (i1 < i2)
      | _, _ -> raise (Failure "Type Error: The less than operator is only compatible with ints.")
    )
  | And (e1, e2) -> 
    ( 
      match eval env e1, eval env e2 with
      | Bool b1, Bool b2 -> Bool (b1 && b2)
      | _, _ -> raise (Failure "Type Error: The and (&&) operator is only compatible with boolean values.")
    )
  | Eq (e1, e2) -> 
    ( 
      match eval env e1, eval env e2 with
      | Int i1, Int i2 -> Bool (i1 = i2)
      | Bool b1, Bool b2 -> Bool (b1 = b2)
      | _, _ -> raise (Failure "Type Error: The equality operator is only compatible with integer and boolean values.")
    )
  | Not exp ->
    ( 
      match eval env exp with
      | Bool b -> Bool (not b)
      | _ -> raise (Failure "Type Error: The not (!/~) operator is only compatible with boolean values.")
    )
  | Let (n, t, dexpr, body) ->
    (  
      let newval = eval env dexpr in
      let n_env = (n,newval)::env in
      eval n_env body
    )
  | Val v -> v
  (* The ID expression can pass a reference to any value, so we need to use our lookup method to determine the value. *)
  (* This case catches variables and evaluates them in the correct val env to return the value of the ref. *)
  | Id n -> lookup n env
  (* The apply expression takes in two expressions and applies the first to the second, so we need to make sure the cases match. *)
  | App (e1, e2) -> 
      (
        (* we will evaluate e1 and e2 to make sure we dereference any refs via the Id pattern match and have actual values to pass in. *)
        match (eval env e1, eval env e2) with
        | (Closure (s, exp, env1), v1) ->
                eval ((s, v1)::env1 @ env) exp 
        (* Case 2: We somehow passed in 2 expressions that are both functions. Or the exp evaluated to some other junk. 
                  Either way, that's not a valid parameter set to be applied to a function. *)

        (* | (Closure (s1, exp, env), Closure (s2, exp2, env2)) -> 
        raise (Failure ("Type Error: The apply expression is only compatible with a function and a value. Input: 2 functions."))	 *)
        | _ ->  raise (Failure ("Type Error: The apply expression is only compatible with a function and a value."))	
      )
(* If we have a lambda function, we just output a closure so then it can be passed in recursively to the App case we defined above. *)
(* Here, the t is a dummy variable because we don't need it to create the closure. *)
  | Lam (n, t, e1) -> Closure (n, e1, env)

(* 
  I tried to follow Prof. EVW on the lecture, but I am still not fully sure how referencing and dereferencing operates in this specific
  LetRec case
  If we have a recursive let expression, we put the lambda functions within into a closure for apply, and 
   the recRef (as specified by Prof. EVW) is a pointer set to the value 1234 which is a dummy number, since we need to 
   instantiate the recRef variable to point to a value.
   letrec -> matches val to ref 
   recRef = recursive refrerence
   We use recRef to change our recursive reference to the current closure we're using, and then we dereference that ref to provide
   a closure that can now be evaluated by the function recursively.
  Here, t is a dummy variable because we don't need it to return the closure at the end.
*)
  | LetRec (x, t, exp1, exp2) -> let recRef = ref (Int 1234) in 
      (
        match (exp1, exp2) with 
        | (Lam (n, t, exp), Id _) -> 
              (
                let newEnv = (x, Ref recRef)::env 
                in
                let () = recRef := Closure (n, exp, newEnv) in !recRef 
              )
        | _ -> raise (Failure ("Type Error: The LetRec expression is only compatible with a lambda function and a variable."))
      )
  | If (p, q, r) -> 
      (
        (* If p, then q, else r *)
        match eval env p with
        | Bool true -> eval env q 
        | Bool false -> eval env r
        | _ -> raise (Failure ("Faulty If Statement: The if statement didn't evaluate to a boolean result."))
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
