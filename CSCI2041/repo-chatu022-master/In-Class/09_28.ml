let inc x = x+1

let r1 = map inc [1;2;3;4;5]

let r2 = map int_of_char [ 'a'; '^'; '4' ]

let r3 = map Char.lowercase_ascii [
   'H'; 'e'; 'l'; 'l'; 'o'; ' '; 'W'; 'O';
   'R'; 'L'; 'D' ]

let rec foldr (f: 'a -> 'b -> 'b) (lst: 'a list) (base: 'b) : 'b = 
match lst with
| [] -> base
| x::xs -> f x (foldr f xs base)


let sumr xs = foldr (+) xs 0
(*           
  sumr (1::2::3::[])
-> foldr (+) (1::2::3::[]) 0
-> (+) 1 (foldr (+) (2::3::[]) 0)
-> (+) 1 ((+) 2 (foldr (+) (3::[]) 0))
-> (+) 1 ((+) 2 ((+) 3 (foldr (+) [] 0)))
-> (+) 1 ((+) 2 ((+) 3 0))
-> (+) 1 ((+) 2 3)
-> (+) 1 5
-> 6
(+) 1 ((+) 2 ((+) 3 0))
in infix form
1 +  (2 +  (3 + 0))
looks like
1 :: (2 :: (3 :: []))
replaced + with ::
    and 0 with []

foldr called a homomorphsim
*)

            
let partition f lst =
  let g elem (pass,fail) = if f elem
                          then (elem::pass, fail)
                          else (pass, elem::fail)
  in 
  foldr g lst ([], []) 

let partition_with_poorly_named_helper_function f lst =
  let f elem (pass,fail) = if f elem
                          then (elem::pass, fail)
                          else (pass, elem::fail)
  in 
  foldr f lst ([], []) 
  

let rec foldl (f: 'b -> 'a -> 'b) (accum: 'b) (lst: 'a list) : 'b =
  match lst with
  | [] -> accum
  | x::xs -> foldl f (f accum x) xs

let length lst = foldl (fun b a -> b + 1)  0 lst
              
let suml xs = foldl (+) 0 xs
(*
  suml (1::2::3::[])
-> foldl (+) 0 (1::2::3::[])
-> foldl (+) ((+) 0 1) (2::3::[])
-> foldl (+) 1 (2::3::[])
-> foldl (+) ((+) 1 2) (3::[])
-> foldl (+) 3 (3::[])
-> foldl (+) ((+) 3 3) []
-> foldl (+) 6 []
-> 6
((0 + 1) + 2) + 3
*)

let max lst = match lst with
    | [] -> failwith "Oh no - the empty list!"
    | x::xs -> foldl (fun b a -> if a > b then a else b) x xs


let group_by_3 lst =
  let accum : 'a list * 'a list list = ([], [])
  in
  let f (elems, groups) elem = 
    if length elems = 2
    then ([], ((elem::elems) :: groups))
    else (elem::elems, groups)
  in
  foldl f accum lst


