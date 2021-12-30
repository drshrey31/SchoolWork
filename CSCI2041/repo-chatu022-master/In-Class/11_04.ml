(* Evaluation with functions, and static type checking *)

type value 
  = Int of int
  | Bool of bool
  | Closure of string * expr * value_env

(* let inc = fun x -> x + 1
   ----> Closure ("x", ``x + 1'', [])
   let x = 4 in
     let addto = fun y -> x + y
    value of addto is Closure ("y", ``x + y'', [ ("x", 4) ])
*)
and value_env = (string * value) list

and expr 
  = Val of value

  | Add of expr * expr
  | Sub of expr * expr
  | Mul of expr * expr
  | Div of expr * expr 

  | Lt of expr * expr
  | Eq of expr * expr
  | And of expr * expr
  | Not of expr

  | Let of string * expr * expr
  | Id of string

  | App of expr * expr
  | Lam of string * expr
         
type typ
  = Int_type   (* int *)
  | Bool_type  (* bool *)
  | Func_type of typ * typ   (* int -> int, int -> (int -> int) *)

type type_environment = (string * typ option) list 