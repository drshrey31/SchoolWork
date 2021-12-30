let is_empty ls = 
  match ls with
  | [] -> true
  | hd::tl -> false

let head ls = 
  match ls with
  | hd::tl -> hd
  | [] -> []