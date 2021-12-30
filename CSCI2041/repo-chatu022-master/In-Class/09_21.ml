let m = [("dog", 1); ("chicken", 2); ("dog", 3); ("cat", 5)]

let rec lookup_all s m =
  match m with
  | []->[]
  | (name,value)::ms ->
    let rest = lookup_all s ms
    in if s = name then value :: rest else rest

let rec find_all_by eq elem lst = 
  match lst with
  | [] -> []
  | x::xs when eq x elem -> x::(find_all_by eq elem xs)
  | _::xs -> find_all_by eq elem xs

let int_eq x y = x = y
(* function  used to set x and y equal*)

let lookup_all' s m = 
  find_all_by (fun (s', v') s -> s' = s) s m