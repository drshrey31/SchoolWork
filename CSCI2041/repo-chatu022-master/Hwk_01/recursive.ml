(*Part I*)
let odd n =
  if n mod 2 = 1 then true 
  else false

let rec euclid a b =
  if b = 0 then a 
  else euclid b (a mod b)

let frac_simplify (a,b) = 
  if euclid a b = a 
  then (1,b/a) 
  else if euclid a b = b 
  then (a/b, 1) 
  else if euclid a b = 1 
  then (a, b)
  else let x = euclid a b 
  in (a/x,b/x)

(*don't be working*)
let rec min_list ls = 
  match ls with
  | [] -> 0
  | x::[] -> x
  | x :: rest -> let y = min_list(rest) 
    in
    if(x < y) then x else y

let rec drop n ls = 
  if n = 0 then ls
  else
  match ls with
  | [] -> []
  | x::[] -> []
  | a::rest -> drop (n-1) rest





  