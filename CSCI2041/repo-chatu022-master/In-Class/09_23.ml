(* Exercise 3 *)

let rec find_all_with f l = 
  match l with 
  | [] -> []
  | x::xs -> 
      let rest = find_all_with f xs
      in if f x then x::rest else rest

(* different functons *)
let rec find_all_by eq elem lst =
  match lst with
  | [] -> []
  | x::xs when eq x elem ->
    x::(find_all_by eq elem xs)
  | _::xs -> find_all_by eq elem xs

let equals x y = x = y

let res1 = find_all_with (equals 4) [1;3;5;4;6]

let res2 = find_all_with ((=) 4) [1;3;5;4;6]

let big_nums n lst = 
  find_all_with (fun elem -> elem > n) lst

let big_nums n lst = find_all_with ((<=) n) lst (* The sign shouldn't be > *)

let flip (f: 'a -> 'b -> 'c) : ('b -> 'a -> 'c)
  = fun b a -> f a b


(* Exercise 4 *)

let find_all_by' eq elem lst = find_all_with (eq elem) -> lst

let big_strs n lst = 
  find_all_by' (fun s n -> String.length s > n) n lst

let rec drop_while lst p =
  match lst with
  | [] -> []
  | x::xs when p x -> drop_while xs private
  | _::_ -> lst
(* Exercise 5 *)

let compose (f: 'a -> 'b) (g: 'b -> 'c) (x: 'a) : 'c =
  g (f x)

let uncurry (f: 'a -> 'b -> 'c) : (('a * 'b) -> 'c)=
  (fun (a,b) -> f a b)

