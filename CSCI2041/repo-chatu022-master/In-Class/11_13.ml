(* Some functions used in S4.2 Improving Performance 
Some of this material comes from section 9.4 of Chris Reade's book
``Elements of Functional Programming''.  This is in the `Resources`
directory of the public class repository.
Some were written by Charlie Harper.
 *)

(* What is problematic with these functions? 
   These are not tail recursive. We have to return and do more work. 
 *)

 let rec length lst = match lst with
 | [] -> 0 
 | _::xs -> 1 + length xs

let length_a lst =
 let rec accum len lst' = match lst' with
     | [] -> len
     | x::xs -> accum (len + 1) xs
 in accum 0 lst
       

 
let rec sum lst = match lst with
 | [] -> 0
 | x::xs -> x + sum xs

(* 
 sum [1;2;3] 
= 1 + sum [2;3]
= 1 + (2 + sum [3]) 
= 1 + (2 + (3 + sum []))
= 1 + (2 + (3 + 0))
= 1 + (2 + (3)) 
= 1 + 5
= 6
*)           

(* what is sum as a loop? 
 sum = 0
 while (lst matches x::xs) do
   sum = x + sum
   lst = xs
lst = [1;2;3]
sum = 0
x = 1, xs [2;3]
sum = 1 + 0 = 1
lst = [2;3]
x = 2; xs [3]
sum = 2 + 1 = 3
lst = [3]
x = 3; xs []
sum = 3 + 3 = 6
lst = []
*)            


let sum_a lst =
 let rec accum sum lst' = match lst' with
      (* sum = sum of all elements of lst that are not in lst',
         lst' is a the back end of some elements in lst *)
     | [] -> sum
     | x::xs -> accum (sum + x) xs
 in
 accum 0 lst

 (* sum lst = sum_a lst *) 
(*
 sum_a [1;2;3]
= accum 0 [1;2;3]
= accum (0+1) [2;3]
= accum 1 [2;3]
= accum (1+2) [3]
= accum 3 [3]
= accum (3+3) []
= accum 6 []
= 6
*)
         
let rec listof n =
 match n with
 | 0 -> []
 | _ -> n :: listof (n-1)

let rec append l1 l2 =
 match l1 with
 | [] -> l2
 | x::xs -> x :: (append xs l2)

let rec rev lst =
 match lst with
 | [] -> []
 | x::xs -> append (rev xs) [x]
                  
