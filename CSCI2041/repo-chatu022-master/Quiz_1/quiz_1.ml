(* Shreyas Chaturvedi *)

(* I understand that the work to be done on Quiz 1 is to be done on my
own, without any help from my classmates or others.  Discussing the
questions or solutions is an act of academic misconduct and I
understand the penalties as laid out in the syllabus for this. *)

let even x = x mod 2 = 0

(* Since we need to come up with one value, I am using List.fold
I used a function that calls the even method to determine if an element in the list is even.
If it is, then the counter value gets incremented, and this process happens for the whole
list, starting from the head of the list (with counter = 0), going to the left.*)
let rec count_evens ls =
  List.fold_left (fun counter x -> if even x then counter + 1 else counter) 0 ls

let count f ls =
  List.fold_left (fun counter x -> if f x = true then counter + 1 else counter) 0 ls

let count_evens_2 ls = 
  count even ls

let is_square n =
  let m = sqrt(float_of_int n) 
  in
  if m*.m = (float_of_int n) then true else false

let count_squares ls = 
  count is_square ls 

(* At first, I tried using List.hd ls as the base case for my fold left, but this didn't work because
I was subtracting the head from itself, and therefore not counting the value of the first element. 
So, I did List.hd ls * 2 so that the first subtraction would just result in the head of the list*)
let subtract_lst ls = 
  if ls = [] then 0 
  else 
  List.fold_left (-) ((List.hd ls)*2) ls


(* I used a fold left helper that I adapted from "higher.ml" within 
the sample programs in the course resources on GitHub. *)
let suml ls =  
  let rec fold_left_helper sum ls =
    match ls with
    | [] -> sum
    | x :: rest -> fold_left_helper (sum + x) rest 
  in
  fold_left_helper 0 ls
 
(* 
suml (1::2::3::[])
0 + fold_left_helper (1::2::3::[])
0 + 1 + fold_left_helper (2::3::[])
(0 + 1 + 2) + fold_left_helper (3::[])
(0 + 1 + 2 + 3) + fold_left_helper ([])
6
*)





