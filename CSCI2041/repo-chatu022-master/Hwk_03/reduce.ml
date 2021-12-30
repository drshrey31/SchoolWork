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


let rec reduce (b: 'b) (f: 'a -> 'b -> 'b -> 'b) (t: 'a tree) : 'b =
    match t with
    | Empty -> b
    | Node (v, t1, t2) -> f v (reduce b f t1) (reduce b f t2)

(* "sizer" is the size addition function passed into reduce to count each value as one size unit. *)
let size (tree: 'a tree): int = 
  let sizer l n1 n2 =  1 + n1 + n2
  in 
  reduce 0 sizer tree

(* "adder" is the addition function passed into reduce to count each int of the tree. *)
let sum (intree: int tree) : int =
  let adder l n1 n2 =  l + n1 + n2
  in 
  reduce 0 adder intree

(* "multiplier" is the multiplication function passed into reduce to multiply each int of the tree. *)
let product (intree: int tree) : int =
  let multiplier l n1 n2 =  l * n1 * n2
  in 
  reduce 1 multiplier intree

(* "counter" is the counting function passed into reduce to count length of each string of the tree. *)
let charcount (stree: string tree) : int =
  let counter y y1 y2 =  String.length(y) + y1 + y2
  in 
  reduce 0 counter stree

(* "concatter" is the function passed into reduce to concatenate each string of the tree. *)
let concat (stree: string tree) : string =
  let concatter y y1 y2 = y1 ^ y ^ y2
  in 
  reduce "" concatter stree

(* "sizer" is a helper method to break down the tree of lists into a format so that the reduce method we defined could
    identify it as a node with a value (length of list "ele") and two other nodes.
*)
let list_tree_size listree =
  let sizer ele accum1 accum2 = List.length(ele) + accum1 + accum2
  in 
  reduce 0 sizer listree

(* 
    "adder" is a helper method that uses the list fold left method to add the ints inside of each list inside of the nodes of the trees, which
    are accessed by reduce when sum_list essentially breaks down the tree of lists into a node format for reduce to add the nodes over.
*)  
let list_tree_sum (ilistree: int list tree) : int =
  let adder ls = List.fold_left (fun a b -> b + a) 0 ls
  in 
  let sum_list ele accum1 accum2 = adder ele + accum1 + accum2
  in
  reduce 0 sum_list ilistree

(* 
    "multiplier" is a helper method that uses fold left to multiply values of each list inside of the nodes of the trees, which
    are accessed by reduce when prod_list essentially breaks down the tree of lists into a node format for reduce to multiply the nodes over.
*)  
let list_tree_product (ilistree: int list tree) : int =
  let multiplier ls = List.fold_left (fun a b -> b * a) 1 ls
  in 
  let prod_list ele accum1 accum2 = multiplier ele * accum1 * accum2
  in
  reduce 1 prod_list ilistree

(* 
    "counter" is a helper method that uses fold left to count chars of each str list inside of the nodes of the trees, which
    are accessed by reduce when charcounter essentially breaks down the tree of lists into a node format for reduce to count all the lists over.
*)    
let list_tree_charcount (slistree: string list tree) : int =
  let counter ls = List.fold_left (fun a b -> a + String.length(b)) 0 ls
  in
  let charcounter ele accum1 accum2 = counter ele + accum1 + accum2
  in 
  reduce 0 charcounter slistree

(* 
    "concathelper" is a helper method that uses fold left to concatenate chars of each str list inside of the nodes of the trees, which
    are accessed by reduce when concatter essentially breaks down the tree of lists into a node format for reduce to map the concatenation over.
*)    
let list_tree_concat (slistree: string list tree) : string =
  let concathelper ls = List.fold_left (fun a b -> a ^ b) "" ls
  in
  let concatter ele accum1 accum2 =  accum1 ^ concathelper(ele) ^ accum2
  in 
  reduce "" concatter slistree


(* Reduce.ml Testing  *)
let () = 
  print_string "Testing part 3 ... " ;
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
