(* Demonstrations and exercises of higher order functions *)

(* Exercise 11 *)

let rec map f lst = match lst with
  | [] -> []
  | x::xs -> f x :: map f xs

let inc x = x+1

let r1 = map inc [1;2;3;4;5]

let r2 = map int_of_char [ 'a'; '^'; '4' ]

let r3 = map Char.lowercase_ascii [
   'H'; 'e'; 'l'; 'l'; 'o'; ' '; 'W'; 'O';
   'R'; 'L'; 'D' ]

(* Filter *)
let even n = n mod 2 = 0

let positive x = x > 0.0

let is_blank_or_tab ch = ch = ' ' || ch = '\t'

(* filter:  ('a -> bool) -> a' list -> 'a list *)

let rec filter f lst = match lst with
  | [] -> []
  | x::xs -> if f x
             then x :: filter f xs
             else filter f xs

let smush cs =
  let f c = c <> ' ' && c <> '\t' && c <> '\n'
  in filter f cs


(* fold : ('a -> 'a -> 'a) -> 'a -> 'a list -> 'a *)
(* Is this one fold left or fold right? *)
let rec fold f base lst = match lst with
  | [] -> base
  | x::xs -> f x (fold f base xs)

