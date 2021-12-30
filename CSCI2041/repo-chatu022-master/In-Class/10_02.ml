(*exercise 1*)

type shape = Circle of circ_desc
          | Triagnle of coord * coord * coord 
          | Rect of sqr_desc
let isRect s = match s with
            | Rect _ -> true
            | _ -> false

(*exercise 2*)
(*math class in java, linked lists, binary trees*)
(*Binary_tree tree = new binary_ree*)
(* if in c you use the struct keyword if in java you define a class with variables*)

let rec minList lst = 
  match lst with
  | [] -> none
  | x ::[] -> some x
  | x::xs -> match minList xs with
            | none -> failwith "oo[s"
            | some m->
            if x < m then some x else some m