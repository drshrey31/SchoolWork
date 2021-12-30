(* Even2Ways professor's solution *)

let even2ways_v2 lst = match lst with
  | []-> true
  | x::[]-> false
  | x1::x2::rest -> if x1 mod 2 = 0 && x2 mod 2 = 0 then even2ways rest else false

  (* let sum xs = List.fold 0 xs *)
(* Exercise 6 *)
let is_empty lst = match lst with
  | [] -> true
  | _::_ -> false 
  (* head of the list and tail of the list *)

(* Function that uses recursion as a way to find length of list *)
let rec length xs = match xs with
  | [] -> 0
  | _::rest -> 1 + length rest