(* Natural numbers *)
type nat
  = Zero
  | Succ of nat

let rec reduce_nat  (z: 'b) (s: 'b -> 'b)   (n: nat) : 'b =
  match n with
  | Zero -> z
  | Succ n' -> s (reduce_nat z s n')

let to_int (n: nat) : int = reduce_nat 0 (fun i -> i + 1) n

let () = assert (to_int (Succ (Succ (Succ Zero))) = 3)

(* Binary trees, from higher.ml *)
type 'a btree
  = Empty
  | Node of 'a * 'a btree * 'a btree

let rec reduce_btree (e: 'b) (n: 'a -> 'b -> 'b -> 'b)  (t: 'a btree) : 'b =
  match t with
  | Empty -> e
  | Node (v, t1, t2) -> n v (reduce_btree e n t1) (reduce_btree e n t2)

let t = Node(5, Node(4, Node(1, Empty, Empty), Empty), Empty)

let () = assert (reduce_btree 0 (fun v b1 b2 -> v + b1 + b2) t = 10)

(* Hwk 03 *)
type 'a btree_Hwk_3
  = Nil
  | Leaf of 'a
  | Fork of 'a btree_Hwk_3 * 'a * 'a btree_Hwk_3

(* A reduce function for this .... *)                                    

(* Some issues with inductive proofs *)

let rec sum (lst: int list) : int =
  match lst with
  | [] -> 0
  | x::xs -> x + sum xs

let () = assert (sum [1;2;3;4] = 10);
         assert (sum [] = 0)

                (* A property: sum (l1 @ l2) = sum l1 + sum l2
   Principle of Induction
   P(lst) holds if P([]) holds and
                   if P(lst') => P(v :: lst') for any value v
   We derive this from the datatype
   One clause for each element of the datatype Each clause is an
   implication, the assumptions are for each component
   of the constructor that have the same type as the
   type being defined.
   See notes_10_14.md for the proof of this property.
*)

let sumr (lst: int list) : int =
  reduce_list 0 (+) lst

let () = assert (sumr [1;2;3;4] = 10);
         assert (sumr [] = 0)

(* sum lst = sumr lst 
Base case: sum [] = sumr []
Ind case : sum (x::xs) = sumr (x::xs)
Base case
  sum []
= 0
  by def of sum
= reduce_list 0 (+) []
  by def of reduce_list
= sumr []
  by def of sumr
Inductive case:
Ind. hypothesis: sum xs = sumr xs
  sum (x::xs) 
= x + sum xs
  by def of sum
= x + sumr xs
  by inductive hyp.
= (+) x (sumr xs)
  by using + as a function
= (+) x (reduce_list 0 (+) xs)
  by def of sumr
= reduce_list 0 (+) (x::xs)
  by def of reduce
= sumr (x::xs)
  by def of sumr
*)
           
(* How about product?
   prod (l1 @ l2) = prod l1 * prod l2
   prod ([] @ l2) = prod [] * prod l2
 *)

let rec prod (lst: int list) : int =
  match lst with
  | [] -> 1
  | x::xs -> x * prod xs

let () = assert (prod [2;3;4] = 24);
         assert (prod [] = 1)

(* This continues on Hwk 4 and Quiz 2 ... *)