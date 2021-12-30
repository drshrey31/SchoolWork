let circle_area r = r *. r *. 3.14

let rec power n k = 
  if n = 0 then k
  else k *. power (n-1) k

let rec cube n = power 3 n

let rec all xs = 
  match xs with 
  [] -> true
  | x::rest -> x && all rest

let rec even2wayshelp xs  c= 
  match xs with
  | [] -> if c mod 2 = 0 then true else false
  | hd::tl -> if hd mod 2 = 0 then true && even2wayshelp tl (c+1) else false

let rec even2ways xs = 
  even2wayshelp xs 0

