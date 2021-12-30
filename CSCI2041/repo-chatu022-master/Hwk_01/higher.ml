let all_odds ls = 
  List.filter (fun n -> if n mod 2 = 1 then true else false) ls

let decrement_all ls = 
  List.map (fun x -> x-1) ls

let min_fold ls = 
  List.fold_left (fun x y -> min x y) (List.hd ls) ls

let sum_prod ls = 
  (List.fold_left (fun x y -> x + y) 0 ls, List.fold_left (fun x y -> x * y) 1 ls)

(* Rev function from Lab 4, using it as Helper function for partition left to correctly order elements *)
let rev ls = 
  List.fold_left (fun a b -> b::a) [] ls

let partition_left f ls =
  let g (pass,fail) elem = if f elem
  then (elem::pass, fail)
  else (pass, elem::fail)
  in 
  List.fold_left g ([], []) (rev ls)

let partition_right f ls =
  let g elem (pass,fail) = if f elem
  then (elem::pass, fail)
  else (pass, elem::fail)
  in 
  List.fold_right g ls ([], [])
  

(* I used list fold right instead of list fold left because it allowed me to add on the list at the end *)
(* When I tried to use list fold left, the order is reversed since the new element is being added to the front. *)
let map_as_fold f ls = 
  List.fold_right (fun a b -> (f a)::b) ls [] 