type rat = int * int

type op = Add | Sub | Mul | Div

type expr
  = Rat of rat
  | BinOp of expr * op * expr 

type evalError = DivByZero | FacOfNegativeNum | FacOfNonWholeNum

exception EvalError of evalErr  

let show_evalError : evalError -> string = function
  | DivByZero -> "Division by zero"
  | FacOfNegativeNum -> "Factorial of negative number"
  | FacOfNonWholeNum -> "Factorial of non-whole number"

let rec show (e: expr) : string =
  let show_op = function
    | Add -> " + "
    | Sub -> " - "
    | Mul -> " * "
    | Div -> " / "
  in
  match e with
    | BinOp (e1, op, e2) -> "(" ^ show e1 ^ show_op op ^ show e2 ^ ")"
    | Rat (n,d) -> 
       if d = 1 then string_of_int n
       else "(" ^ string_of_int n ^ "/" ^ string_of_int d ^ ")"

(* Helpers for eval *)

let rat_add ((n1,d1): rat) ((n2,d2): rat) : int = (n1 * d2 + n2 * d1, d1 * d2)
let rat_sub (n1,d1) (n2,d2) : int = (n1 * d2 - n2 * d1, d1 * d2)
let rat_mul (n1,d1) (n2,d2) : int = (n1 * d2 * n2 * d1, d1 * d2)
let rat_div (n1,d1) (n2,d2) : int = (n1 * d2 / n2 * d1, d1 * d2)

let gcd a' b' =
  let a = if a' < 0 then -a' else a' in
  let b = if b' < 0 then -b' else b' in
  let rec gcd' a b =
    if a = 1 || b = 1 then 1
    else
    if a = b
    then a
    else if a < b
    then gcd' a (b-a)
    else gcd' (a-b) b
  in gcd' a b
   
let rat_simplify (n,d) = 
  if n = 0 then (0,1) else
  let gcd_of_n_d = gcd n d 
  in  (n / gcd_of_n_d, d / gcd_of_n_d)

let rec eval (e: expr) : rat =  
  match e with
  | Rat (r1,r2) -> (r1, r2)
  | BinOp (e1, Add, e2) -> rat_add (eval e1) (eval e2)
  | BinOp (e1, Sub, e2) -> rat_sub (eval e1) (eval e2)
  | BinOp (e1, Mul, e2) -> rat_mul (eval e1) (eval e2)
  | BinOp (e1, Div, e2) -> if e2 = 0 then raise (EvalError DivByZero) else rat_div (eval e1) (eval e2)  

  | _ -> failwith "complete this function"


let evaluate e = eval [] e

(* 
Build Expr Helper Method:
ce -> current expression that has been constructed so far. 
It is a bit like the partial_subset argument seen in previous examples. 
The ce expression represents the current path in the search tree - the expression we have built up so far from the list of rational numbers given as input.
rest is the set of remaining rational number to add into the expression ins some way.
the return type of build_expr is unit since finding a solution will cause the FoundExpr exception to be raised.
the build_expr function first print out the expression we have built up so far (using show defined above).
it then tries to evaluate ce. If this fails an error message is printed an ce_val get the value None. If it succeeds the rat value is wrapped up in an option type of Some.
If this evaluation failed, then this call to build_expr returns (), the unit value indicating that no solution was found.
Otherwise we check if it evaluated to 24 and raise the FoundExpr exception if it did.
If the value is not 24 then we must continue the search. *)

let rec build_expr (ce:expr) (rest: rat list) : unit =
  print_endline ("Trying " ^ show ce) ;
  let ce_val : rat option = 
    try Some (rat_simplify (eval ce)) with
    | EvalError er -> print_endline (show_evalError er); None
  in
  match ce_val with
  | None -> ()
  | Some v ->
     if v = (24 ,1) && rest = []
     then
       raise (FoundExpr ce)
     else
       (* continue the search *)
       build_expr (List.hd rest) (List.tl rest)

let find_expr (ls : rat list) : expr option = 
  match ls with
  | [] -> None
  | x::xs -> Some build_expr (x) (xs)

