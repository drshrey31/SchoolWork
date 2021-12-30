type expr
  = Int of int
  | Add of expr * expr
  | Mul of expr * expr
  | Sub of expr * expr
  | Div of expr * expr
  | Let of string * expr * expr
  | Id of string
        
let e1 = Add (Mul (Int 2, Int 4), Int 5)
let e2 = Let ("x", Int 4, Add (Int 5, Id "x"))
let e3 = Let( "x", Int 3,
      Add( Mul (Int 2, Id "x"),
           Let( "y", Add (Id "x", Int 4),
                     Add (Id "x", Id "y"))))

let rec lookup (env: (string * int) list) (n: string) : int =
  match env with
  | [] -> failwith ("The name " ^ n ^ " is not bound by a let.")
  | (n',v)::rest when n' = n -> v
  | (_,_)::rest -> lookup rest n

let rec eval (env: (string * int) list) (e: expr) : int =
  match e with
  | Int i -> i
  | Add (e1, e2) -> eval env e1 + eval env e2
  | Mul (e1, e2) -> eval env e1 * eval env e2
  | Sub (e1, e2) -> eval env e1 - eval env e2
  | Div (e1, e2) -> eval env e1 / eval env e2
  | Let (n, e1, e2) -> eval ( (n,eval env e1) :: env) e2
  | Id n -> lookup env n


(* let x = 3 in 3 + x *)