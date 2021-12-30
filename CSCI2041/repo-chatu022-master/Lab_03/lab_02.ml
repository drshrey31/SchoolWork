(* Shreyas Chaturvedi: chatu022@umn.edu, John Lei: lei00007@umn.edu, Nolan K: kell2490@umn.edu *)


(* Changes: Change nothing as it's already in one line, change pi to 3.1415925 instead of 3.1415 *)
let circle_circum_v1 (r: float) = r *. 3.1415926 *. 2.

(* Changes: Change the indentation to make it more readable *)
let circle_circum_v2 (r: float) = 
  let pi = 3.1415926 
  in 
  r *. pi *. 2.

(* Changes: Change nothing as nothing needs modification *)
let rec product ls = 
  match ls with
  | [] -> 1
  | hd::tl -> hd * product tl

(* Changes: Add the exceptions in the case of no elements or 1 element instead of returning zero as comments *)
let rec sum_sqrdiffs (ls: int list) =
  match ls with 
    (* | _ -> raise (Failure "sum_sqrdiffs input list needs at least two elements")
  | _ ::[] -> raise (Failure "sum_sqrdiffs input list needs at least two elements")   *)
  | [] -> 0
  | x :: [] -> 0
  | x1::(x2::[]) -> (x1-x2)*(x1-x2)
  | x3::x4::tl -> ((x3 - x4) * (x3 - x4)) + sum_sqrdiffs (x4::tl)


(* Changes: Change the indentation to make it more readable *)
let distance (x1,y1) (x2, y2) = 
  let d1 = x1 -. x2 
  in 
  let d2 = y1 -. y2 
  in 
  sqrt (d1*.d1 +. d2*.d2)

(* Changes: Change the indentation to make it more readable *)
let triangle_perimeter p1 p2 p3 = 
  let dist1 = distance p1 p2 
  in 
  let dist2 = distance p1 p3 
  in 
  let dist3 = distance p2 p3 
  in 
  dist1 +. dist2 +. dist3