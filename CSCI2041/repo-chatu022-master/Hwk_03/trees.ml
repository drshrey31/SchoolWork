(* Part I *)

(* A tree type declaration. *)
type 'a tree = Empty
             | Node of 'a * 'a tree * 'a tree

(* A sample tree containing ints *)
let int_tree : int tree =
  Node (3, 
        Node (1,
              Node (4, Empty, Empty), Empty), 
        Node (2, Empty, Empty) 
       )

let int_tree_2 : int tree =
  Node (7, 
        Node (3,
              Node (4, Empty, Empty), Empty), 
        Node (1, Empty, Empty) 
       )       

(* A sample tree containing strings *)
let str_tree : string tree = 
  Node ("love ", 
        Node ("really ", 
              Node ("I ", Empty, Empty), Empty), 
        Node ("OCaml!", Empty, Empty) 
       )

let cov_tree : string tree = 
  Node ("trashy ", 
        Node ("is a really ", 
              Node ("COVID-19 ", Empty, Empty), Empty), 
        Node ("thing!", Empty, Empty) 
       )

(* Size function is used to recursively add each value as 1 size unit
Base case: empty tree -> 0
Case 2: node with value and 2 nodes -> 1 + recursive calls on both nodes *)

let rec size (tree: 'a tree) : int =
  match tree with
  | Empty -> 0
  | Node (a,t1,t2) -> 1 + size t1 + size t2

(* Sum function is used to recursively add each int
Base case: empty tree -> 0
Case 2: node with value and 2 nodes -> value + recursive calls on both nodes *)
let rec sum (intree: int tree) : int =
  match intree with
  | Empty -> 0
  | Node (i, t1, t2) -> i + sum t1 + sum t2

(* Product function is used to recursively multiply each int in the tree
Base case: empty tree -> 1
Case 2: tree with node that has only one value -> value
Case 3: node with value and 2 nodes -> value * recursive calls on both nodes *)

let rec product (intree: int tree) : int =
  match intree with
  | Empty -> 1
  | Node (i, Empty, Empty) -> i
  | Node (i, t1, t2) -> i * product t1 * product t2

(* Charcount function is used to recursively count length of each string in the tree
Base case: empty tree -> 0
Case w: node with string str and 2 nodes -> string length of str * recursive calls on both nodes *)

let rec charcount (stree: string tree) : int =
  match stree with
  | Empty -> 0
  | Node (str,t1,t2) -> String.length(str) + charcount t1 + charcount t2

(* Concat function is used to recursively concatenate each string in the tree into one string
Base case: empty tree -> ""
Case 2: node with string str and 2 nodes -> string length of str concatenated to the recursive calls on both nodes *)

let rec concat (stree: string tree) : string =
  match stree with
  | Empty -> ""
  | Node (str,t1,t2) ->  concat t1 ^ str ^ concat t2


(* Part 2 *)

let ints_tree: int list tree =
  Node ([1;3],
        Node ([4;5;6], 
              Empty,
              Node ([], Empty, Empty)
             ),
        Node ([],
              Node ([1;6], Empty, Empty),
              Node ([9;2;8],Empty,Empty)
             )
       )

let custom_ints_tree: int list tree =
  Node ([1;3;5;6;7],
        Node ([99;6;13;4;67], 
              Empty,
              Node ([1;2;3;4;5], Empty, Empty)
             ),
        Node ([74;23;6],
              Node ([1;6], Empty, Empty),
              Node ([9;2;8],Empty,Empty)
             )
       )

let strs_tree: string list tree = 
  Node (["Ocaml!  "; "It "; "must "; "be "],
        Node (["do "; "love "], 
              Node (["I "; "really "], Empty, Empty), Empty), 
        Node (["your "; "favorite "; "too!"], Empty, Empty) 
       )

let shrey_tree: string list tree = 
  Node (["boy  "; "Shrey, "; "I'm "; "the "],
        Node (["is "; "ya "], 
              Node (["Ayo "; "this "], Empty, Empty), Empty), 
        Node (["sickest "; "CSCI "; "kid!"], Empty, Empty) 
       )
let rec list_tree_size (listree: 'a list tree) : int =
  match listree with 
  | Empty -> 0 
  | Node (x, t1, t2) -> List.length x + list_tree_size t1 + list_tree_size t2 

(* All these list functions use the same logic as their individual node counterparts but with list fold to fold values into one data type *)

let rec list_tree_sum (ilistree: int list tree) : int = 
  match ilistree with
  | Empty -> 0
  | Node(x, t1, t2) -> (List.fold_left (fun a b -> a + b) 0 x) + list_tree_sum t1 + list_tree_sum t2

let rec list_tree_product (ilistree: int list tree) : int = 
  match ilistree with
  | Empty -> 1
  | Node(x, t1, t2) -> (List.fold_left (fun a b -> a * b) 1 x) * list_tree_product t1 * list_tree_product t2

let rec list_tree_charcount (slistree: string list tree) : int = 
  match slistree with
  | Empty -> 0
  | Node(x, t1, t2) -> List.fold_left (fun a b -> a + String.length b) 0 x + list_tree_charcount t1 + list_tree_charcount t2

let rec list_tree_concat (slistree: string list tree) : string = 
  match slistree with
  | Empty -> ""
  | Node(x, t1, t2) ->  list_tree_concat t1 ^ (List.fold_left (fun a b -> a ^ b) "" x )^ list_tree_concat t2
        
(* Testing *)

(* Part I *)
 let () = 
  print_string "Testing part 1 ... " ;
  try
    
    assert (size str_tree = 4);
    assert (sum int_tree = 10);
    assert (product int_tree = 24);
    assert (charcount str_tree = 20);
    assert (concat str_tree = "I really love OCaml!");
   
    print_string "tests passed.\n"
  with
    Assert_failure (file, line, column) -> 
    let msg = "\n\n\nAssert failed on line " ^ string_of_int line ^ 
                ", column " ^ string_of_int column ^ "\n\n\n\n"
    in print_string msg

(* Part II *)
let () = 
  print_string "Testing part 2 ... " ;
  try
    
  assert (size str_tree = 4);
  assert (sum int_tree = 10);
  assert (sum int_tree_2 = 15);
  assert (product int_tree = 24);
  assert (product int_tree_2 = 84);
  assert (charcount str_tree = 20);
  assert (charcount cov_tree = 34);
  assert (concat str_tree = "I really love OCaml!");
  assert (concat cov_tree = "COVID-19 is a really trashy thing!");

  assert (list_tree_size strs_tree = 11);
  assert (list_tree_size shrey_tree = 11);
  assert (list_tree_sum ints_tree = 45);
  assert (list_tree_sum custom_ints_tree = 355);
  assert (list_tree_product ints_tree = 311040);
  assert (list_tree_product custom_ints_tree = 1380419022779596800);
  assert (list_tree_charcount strs_tree = 54);
  assert (list_tree_charcount shrey_tree = 52);
  assert (list_tree_concat strs_tree = 
            "I really do love Ocaml!  It must be your favorite too!");
  assert (list_tree_concat shrey_tree = 
            "Ayo this is ya boy  Shrey, I'm the sickest CSCI kid!");
  print_string "tests passed.\n"
  with
    Assert_failure (file, line, column) -> 
    let msg = "\n\n\nAssert failed on line " ^ string_of_int line ^ 
                ", column " ^ string_of_int column ^ "\n\n\n\n"
    in print_string msg