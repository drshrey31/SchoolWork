(* Part 4 *)
type 'a btree = Nil
              | Leaf of 'a
              | Fork of 'a btree * 'a * 'a btree

let int_btree : int btree  =         
  Fork (Fork (Nil, 13, Leaf 31), 43,
  Fork (Nil, 51, Fork (Nil, 62, Fork (Nil, 1, Leaf 80)))
      ) 
                    
(* 
insert_by method

Base Case: the binary tree is empty -> then we add a leaf with the value v to it

Case 2: the binary tree has a leaf l -> then we check to see how the value v we're trying to add compares to the value in leaf l,
        and add to the left of the tree if v is lesser, right if v is greater, or replace the leaf if v is the same

Case 3: the binary tree has a fork with a left tree, a center value, and a right tree. 
        We compare the value we're seeking to add to the center value to determine if we're going to add to the left tree (if c > v)
        or to the right tree (if c < v)
*)

let rec insert_by (fx: 'a -> 'a -> int) (v: 'a) (bt: 'a btree) : 'a btree =
 
  match bt with

  | Nil -> Leaf v

  | Leaf l -> if (fx l v) = 0 then Leaf v 

             else if (fx l v) < 0 then Fork (Nil, l, Leaf v)

             else  Fork (Leaf v, l, Nil) 

  | Fork (lt, c, rt) -> if (fx c v) < 0 then Fork (lt, c, insert_by fx v rt)

                        else Fork (insert_by fx v lt, c, rt)


(* Uses fold left and flips the order of arguments in insert_by to support fold_left's left associative operating style                     *)
let from_list (fx: 'a -> 'a -> int) (ls: 'a list): 'a btree  = 
  List.fold_left (fun x y -> insert_by fx y x) Nil ls 

(* 
reduce method: take a binary tree and chop it down into a concise, ordered list

Base case: empty tree -> empty list
Case 2: a leaf with value l -> a list with l
Case 3: a fork with left tree, center value, and right tree -> a list appended in the same order ([lt;c;rt])
        Since the fork is already inherently ordered and the trees will be subsequently ordered by 
        recursive calls to the reduce method, we simply concat the list to each other.
        We use the append @ operator instead of the cons :: operator because we are dealing with lists of 
        unknown quantity at the start.
*)
let rec reduce (bt: 'a btree): 'a list = 
  match bt with 
  | Nil -> []
  | Leaf l -> l::[]
  | Fork(lt, c, rt) -> (reduce lt) @ [c] @ (reduce rt)

let to_list (btree: 'a  btree): 'a list =  
  reduce btree

let () = 
  print_string "Testing part 4 ... " ;
  try
  assert (insert_by compare 4 Nil = Leaf 4);
  assert (insert_by compare 5 Nil = Leaf 5);
  assert (insert_by compare 2 (insert_by compare 4 Nil) =
            Fork (Leaf 2, 4, Nil));
  assert (insert_by compare 3 (insert_by compare 5 Nil) =
              Fork (Leaf 3, 5, Nil));              
  assert (insert_by compare 4 (insert_by compare 2 Nil) =
            Fork (Nil, 2, Leaf 4));
  assert (insert_by compare 8 (insert_by compare 5 Nil) =
            Fork (Nil, 5, Leaf 8));
  assert (insert_by compare 4 (insert_by compare 4 Nil) = 
          insert_by compare 4 Nil);
  assert(insert_by compare 5 (insert_by compare 4 (insert_by compare 4 Nil)) = Fork (Nil, 4, Leaf 5));
  assert (from_list compare [4;2;5;3;6;7;8] =
  Fork (Fork (Nil, 2, Leaf 3), 4,
      Fork (Nil, 5, Fork (Nil, 6, Fork (Nil, 7, Leaf 8)))
      ) 
  );
  assert (from_list compare [5;3;6;3;6;8;10] =
  Fork (Leaf 3, 5, Fork (Nil, 6, Fork (Nil, 8, Leaf 10)))
  );
  assert (reduce int_btree = [13;31;43;51;62;1;80]);
  assert (List.sort compare [4;2;5;3;6;7;8] =
              to_list (from_list compare [4;2;5;3;6;7;8]));
  assert (List.sort compare [41;12;35;23;86;17;48] =
              to_list (from_list compare [41;12;35;23;86;17;48]));
  assert (List.sort compare [1;5;3;2;6;7;4] =
              to_list (from_list compare [1;5;3;2;6;7;4]));
  assert (to_list (from_list compare [9;5;4;6;8]) = [4;5;6;8;9]);
  assert (to_list (from_list compare [91;5;4;6;9;8]) = [4;5;6;8;9;91]);         

      (* Add more asserts here as you need them *)
  print_string "tests passed.\n"
  with
  Assert_failure (file, line, column) -> 
  let msg = "\n\n\nAssert failed on line " ^ string_of_int line ^ 
            ", column " ^ string_of_int column ^ "\n\n\n\n"
  in print_string msg
  