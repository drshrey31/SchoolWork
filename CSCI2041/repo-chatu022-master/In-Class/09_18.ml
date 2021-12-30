let is_empty lst = match lst with
  | [] -> true
  | _::_ -> false 
  (* head of the list and tail of the list *)

let head lst = match lst with
  | [] -> failwith "Oh no, an empty list :("
  | hd ::_ -> hd

let rec drop_value to_drop l = 
  match l with 
  | [] -> []
  | hd :: tl -> when hd = to_drop -> drop_value to_drop tl
  | hd :: tl -> hd :: drop_value to_drop tl

let add_up_3 (triple: int * int * int) : int = 
  match triple with
  | ()

let first_of_3 (x, _, _) = x

type fraction = int * int

let add_fraction (f1:fraction) (f2:fraction) = 
  match f1, f2 with 
  | (n1, d1), (n2, d2) -> (n1,n2)

let rec look_up_all key m = 
  match m with
  | [] -> []
  | (name, value) :: more -> 
    let rest = look_up_all key more
    in if key = name then value :: rest else rest

let rec fib ?(a=Int 0) ?(b=Int 1) n = match n with
  | 0 -> a
  | 1 -> b
  | n -> fib ~a:b ~b:(a +/ b) (n-1)

(*  Types of errors *)
(*  *)