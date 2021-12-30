(* Simple interpreter based on Denotational Semantcs.  
   Eric Van Wyk
 *)

 type value
 = Int of int
 | Bool of bool

type expr = 
 | Val of value
 | Id  of string
 | Add of expr * expr
 | Mul of expr * expr
 | Sub of expr * expr
 | Div of expr * expr
 | Mod of expr * expr
 | Lt  of expr * expr
 | Lte of expr * expr
 | Eq  of expr * expr
 | Not of expr
 | And of expr * expr


(* In our language, variables must be integers.  Thus the state /
  environment maps names (strings) to integer values. *)

type environment = (string * int) list

let rec lookup (name: string) (env: environment) : int =
 match env with 
 | [ ] -> raise (Failure ("Name \"" ^ name ^ "\" not found."))
 | (k,v)::rest -> if name = k then v else lookup name rest

let rec eval (e: expr) (env: environment) : value = 
 match e with
 | Val v -> v
 | Id  n -> Int (lookup n env)
 | Add (e1, e2) -> 
    ( match eval e1 env, eval e2 env with
      | Int v1, Int v2 -> Int (v1 + v2)
      | _ -> raise (Failure "incompatible types, Add")
    )
 | Sub (e1, e2) ->
    ( match eval e1 env, eval e2 env with
      | Int v1, Int v2 -> Int (v1 - v2)
      | _ -> raise (Failure "incompatible types, Sub") 
   )
 | Mul (e1, e2) ->
    ( match eval e1 env, eval e2 env with
      | Int v1, Int v2 -> Int (v1 * v2)
      | _ -> raise (Failure "incompatible types, Mul")
    )
 | Div (e1, e2) ->
    ( match eval e1 env, eval e2 env with
      | Int v1, Int v2 -> Int (v1 / v2)
      | _ -> raise (Failure "incompatible types, Div")
    )
 | Mod (e1, e2) ->
    ( match eval e1 env, eval e2 env with
      | Int v1, Int v2 -> Int (v1 mod v2)
      | _ -> raise (Failure "incompatible types, Div")
    )
 | Lt (e1, e2) ->
    ( match eval e1 env, eval e2 env with
      | Int v1, Int v2 -> Bool (v1 < v2)
      | _ -> raise (Failure "incompatible types, Lt")
    )
 | Lte (e1, e2) ->
    ( match eval e1 env, eval e2 env with
      | Int v1, Int v2 -> Bool (v1 <= v2)
      | _ -> raise (Failure "incompatible types, Lte")
    )
 | Eq (e1, e2) ->
    ( match eval e1 env, eval e2 env with
      | Int v1, Int v2 -> Bool (v1 = v2)
      | Bool v1, Bool v2 -> Bool (v1 = v2)
      | _ -> raise (Failure "incompatible types, Eq")
    )
 | And (e1, e2) ->
    ( match eval e1 env, eval e2 env with
      | Bool v1, Bool v2 -> Bool (v1 && v2)
      | _ -> raise (Failure "incompatible types, And")
    )
 | Not e' ->
    ( match eval e' env with
      | Bool v -> Bool (not v)
      | _ -> raise (Failure "incompatible types, Not")
    )

(* A statement has the expected forms from imperative programming. *)
type stmt =
 | Skip 
 | Assign of string * expr
 | Seq of stmt * stmt
 | ReadNum of string
 | WriteNum of expr
 | WriteStr of string
 | IfThenElse of expr * stmt * stmt
 | While of expr * stmt

 | IfThen of expr * stmt
 | For of string * expr * expr * stmt

(* A program has 
  - a name, 
  - a list of variables used in it, and
  - a statement.
*)
type prog = string * string list * stmt

let rec read_number () : int =
 try int_of_string (read_line ()) with
 | Failure _ ->
    print_endline "Please, enter an integer value: ";
    read_number ()

type state = environment

(* The "meaning" of a statement is a function that maps
  an intput state into an output state. 
  This is done by the `exec` function below.
*)
let rec exec (s: stmt) (stt: state) : state =
 match s with
 | Skip -> stt
 | Assign (nm, e) ->
    (match eval e stt with
     | Int i ->  (nm, i) :: stt
     | Bool _ -> failwith "Bools not allowed in assignments"
    )
 | Seq (s1, s2) -> exec s2 (exec s1 stt)
 | ReadNum nm -> (nm, read_number ()) :: stt
 | WriteNum e ->
    (match eval e stt with
     | Int i -> print_int i; print_newline(); stt
     | Bool _ -> failwith "Incompatible types in WriteNum"
    )
 | WriteStr s -> print_endline s; stt
 | IfThenElse (cond, ts, es) ->
    (match eval cond stt with
     | Bool true  -> exec ts stt
     | Bool false -> exec es stt
     | Int _ -> failwith "Incompatible types in IfThenElse"
    )
 | While (cond, body) ->
    (match eval cond stt with
     | Bool true  -> exec (While (cond, body)) (exec body stt)
     | Bool false -> stt
     | Int _ -> failwith "Incompatible types in While"
    )     
 | IfThen (cond, ts) ->
    let translation_to_core = IfThenElse(cond, ts, Skip)
    in exec translation_to_core stt
 | For (i, start, stop, body) ->
    let translation_to_core =
      Seq (Assign (i, start),
      Seq (Assign ("_stop", stop),
           While ( Lte (Id i, Id "_stop"),
                   Seq (body,
                        Assign (i, Add (Id i, Val (Int 1))) )
                     ) ) )
      in exec translation_to_core stt

let run (p: prog) : state =
 let (name, vars, s) = p 
 in
 print_endline ("Running program " ^ name);
 let init_state = List.map (fun v -> (v, 0)) vars
 in
 exec s init_state

(* Some sample programs *)

let program_assign =
 (* x := 1;
    y := x + 2;
  *)
 ("assign", 
  ["x"; "y"],
  Seq (Assign ("x", Val (Int 1)),
       Assign ("y", Add (Id  "x", Val (Int 2)))
    )
 )

let program_seq =
 (* write "Enter a value for x:";
    read x;
    y := x + 2;
    z := y * 3;
    write "value of z is:";
    write z
  *) 
 ("seq",
  ["x"; "y"; "z"],
  Seq (WriteStr "Enter a value for x:",
  Seq (ReadNum "x",
  Seq (Assign ("y", Add (Id  "x", Val (Int 2))),
  Seq (Assign ("z", Mul (Id  "y", Val (Int 3))),
  Seq (WriteStr "value of z is:",
       WriteNum (Id  "z")
      ) ) ) ) )
 )

let program_ifthenelse_simple =
 (* y = 10
    if y < 15 then write y else write 100
  *)
 ("ifthen_else_simple",
  ["y"],
  Seq (Assign ("y", Val (Int 10)),
       IfThenElse 
         (Lt (Id  "y", Val (Int 15)),
          WriteNum (Id  "y"),
          WriteNum (Val (Int 100))
         )
    )
 )

let program_sum =
 (* write "Enter a number to sum to:";
    read x;
    i = 0;
    sum = 0;
    while (i < x) {
      write i;
      sum = sum + i;
      i = i + 1
    }
    write sum
  *)
 ("sum",
  ["x"; "i"; "sum"],
  Seq (WriteStr "Enter a number to sum to:",
  Seq (ReadNum "x",
  Seq (Assign ("i", Val (Int 0)),
  Seq (Assign ("sum", Val (Int 0)),
  Seq (While (Lt (Id  "i", Id  "x"),
              Seq (WriteNum (Id  "i"),
        Seq (Assign ("sum", Add (Id  "sum", Id  "i")),
             Assign ("i", Add (Id  "i", Val (Int 1)))
            ) ) ),
       WriteNum (Id  "sum")
  ) ) ) ) )
 )

let program_sum_evens_odds =
 (* write "Enter a number to some sums of:";
    read x;
    i = 0;
    sum_evens = 0;
    sum_odds = 0;
    while (i < x) {
      write i;
      if i mod 2 = 0 then
         sum_evens = sum_evens + i;
      else
         sum_odds = sum_odds + i;
      i = i + 1
    }
    write "sum of evens is:";
    write sum_evens;
    write "sum of odds is:";
    write sum_odds
  *)
 ("sum_evens_odds",
  ["x"; "i"; "sum_evens"; "sum_odds"],
  Seq (WriteStr "Enter a number to some sums of:",
  Seq (ReadNum "x",
  Seq (Assign ("i", Val (Int 0)),
  Seq (Assign ("sum_evens", Val (Int 0)),
  Seq (Assign ("sum_odds", Val (Int 0)),
  Seq (While (
           Lt (Id  "i", Id  "x"),
      Seq (WriteNum (Id  "i"),
                Seq (IfThenElse (
                         Eq (Mod (Id  "i", Val (Int 2)), Val (Int 0)),
                         Assign ("sum_evens", Add (Id  "sum_evens", Id  "i")),
                         Assign ("sum_odds", Add (Id  "sum_odds", Id  "i"))
                       ),
         Assign ("i", Add (Id  "i", Val (Int 1)))
         ) ) ),
       Seq (WriteStr "sum of evens is:",
       Seq (WriteNum (Id  "sum_evens"), 
       Seq (WriteStr "sum of odds is:",
            WriteNum (Id  "sum_odds")
      ) ) ) ) ) ) ) ) )
 )


let program_for =
 (* for i = 1 to 5
      write i
  *)
 ("for",
  ["i"],
  For ("i", Val (Int 1), Val (Int 5), WriteNum (Id  "i"))
 )


let program_sum_10 =
 (* sum = 0
    for i = 1 to 10
      sum = sum + i
    write "sum is:";
    write sum
  *)
 ("sum_10",
  ["sum"; "i"],
  Seq (Assign ("sum", Val (Int 0)),
  Seq (For ("i", Val (Int 1), Val (Int 10),
            Assign("sum", Add (Id  "sum", Id  "i"))),
  Seq (WriteStr "sum is",
       WriteNum (Id  "sum")
      ) ) )
 )

 
let all_programs = [
    program_assign; program_seq; 
    program_ifthenelse_simple;
    program_sum; program_sum_evens_odds;
    program_for; program_sum_10
  ]