let circle_circum_v1 (r: float) = r *. 3.1415 *. 2.

let circle_circum_v2 (r: float) = let pi = 3.1415 in r *. pi *. 2.

let rec product ls = 
  match ls with
  | [] -> 1
  | hd::tl -> hd * product tl

let rec sum_sqrdiffs (ls: int list) =
  match ls with 
  | [] -> 0
  | x::[] -> 0
  | x1::(x2::[]) -> (x1-x2)*(x1-x2)
  | x3::x4::tl -> ((x3 - x4) * (x3 - x4)) + sum_sqrdiffs (x4::tl)

let distance (x1,y1) (x2, y2) = 
  let d1 = x1 -. x2 in let d2 = y1 -. y2 in sqrt (d1*.d1 +. d2*.d2)

let triangle_perimeter p1 p2 p3 = 
  let dist1 = distance p1 p2 in let dist2 = distance p1 p3 in let dist3 = distance p2 p3 in dist1 +. dist2 +. dist3