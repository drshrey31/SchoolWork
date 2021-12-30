type 'a tree = Leaf of 'a
             | Fork of 'a tree * 'a tree

let (intree : int tree) = 
    Fork (
      Leaf (3),
      Fork (
        Leaf (1),
        Fork (
              Leaf (4), 
              Fork (Leaf (6), 
                    Leaf (8))
      )
      )
    )

let rec sum (tree : int tree) : int = 
  match tree with
  | Leaf (n) -> n
  | Fork (lt, rt) -> sum lt + sum rt

let rec prod (tree : int tree) : int = 
  match tree with
  | Leaf (n) -> n
  | Fork (lt, rt) -> prod lt * prod rt

(* 
Reduce method: 

lf = leaf func 
ff = fork func 
atree = the tree bruh

We are intending to use lf to run any needed functions on the leaf. 
We are intending to use ff to reduce the two values present in each fork to one value.

Explanation for Annotations:

lf *may change value of leaf, and in the process change types from provided type ('a) to desired type ('b)

ff will take in two values of type 'b and reduce them to one value of type 'b

The reduce method will recursively navigate all forks and leaves, run ff and lf 
and in the end after the recursive calls will return a final value of 'b
*)

let rec reduce (lf: 'a -> 'b) (ff: 'b -> 'b -> 'b) (atree: 'a tree): 'b = 
  match atree with
  | Leaf (n) -> lf n
  | Fork (lt, rt) -> ff (reduce lf ff lt) (reduce lf ff rt)

(* Since there's no change to be made to the leaves for sumr and prodr, the lf will just be the same thing *)
let lf x = x

(* Used (+) for simplicity instead of (fun x y -> x + y) *)
let sumr (tree: int tree) : int = 
  reduce (lf) (+) tree

(* Couldn't simplify multiplication operation, so just did (fun x y -> x * y) *)
let prodr (tree: int tree) : int = 
  reduce (lf) (fun x y -> x * y) tree

(* 
Since we are type casting the leaves from int to string, we pass in the string_of_int as the leaf function. 
Since we want to return a single concatenation of all the values in the tree, we pass in the "^" operator, 
which is a simpler way to write "(fun x y -> x ^ y)" 
*)
let string_of_int_tree (tree : int tree) : string = 
  reduce (string_of_int) (^) tree


