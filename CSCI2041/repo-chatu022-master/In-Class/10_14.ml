let rec place e l = match l with 
  | [ ] -> [e]
  | x::xs when e < x -> e::x::xs
  | x::xs -> x :: (place e xs)

let rec is_elem e l = match l with
  | [ ] -> false
  | x::xs -> e = x || (e > x && is_elem e xs)

let rec sorted l = match l with
  | [ ] -> true
  | x::[] -> true
  | x1::x2::xs -> x1 <= x2 && sorted (x2::xs)