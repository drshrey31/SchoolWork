let length ls = 
  List.fold_left (fun a b -> a + 1) 0 ls

let andf ls = 
  List.fold_left (fun a b -> a && b) true ls

let orf ls =
  List.fold_left (fun a b -> a || b) false ls

let is_elem a ls = 
  List.fold_left(fun b x -> b || x = a) false ls

let rev ls = 
  List.fold_left (fun a b -> b::a) [] ls

let ascii_sum ls =
  List.fold_left (fun a b -> Char.code b + a) 0 ls

  (* match ls with
  | [] -> 0
  | x::[] -> Char.code x
  | y::ls -> Char.code y + ascii_sum ls *)

let lebowski (ls: char list) = 
  let accum str c =
    if c = '.' then str @ [','; ' '; 'd'; 'u'; 'd'; 'e'; '.']
    else str @ [c]
  in
  List.fold_left accum [] ls

  (* [','; ' '; 'd'; 'u'; 'd'; 'e'; '.']  *)
  (* fold left, fold right *)



  