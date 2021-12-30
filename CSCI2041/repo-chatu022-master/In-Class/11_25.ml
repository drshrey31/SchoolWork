(* Searching using options *)

module P = PrintLists
(* Recall, you must use #mod_use "printLists.ml" if opening this
   file in utop. *)

let s = [1; 3; -2; 5; -6]
      
let sum lst = List.fold_left (+) 0 lst

(* Our first implementation of subsetsum uses options to indicate if
   we found a solution or not.  If our searching function 
   ``try_subset`` fails to find a value, it returns None; 
   if it finds what we are looking for, then it returns that 
   values wrapped up in a Some.
 *)

let subsetsum_option_v1 (lst: int list) : int list option
  = let rec try_subset partial_subset rest =
      if rest = [] 
      then P.print_int_list partial_subset
      else () ;
      if sum partial_subset = 0 &&
           partial_subset <> [] &&
             rest = []
      then Some partial_subset
      else match rest with
           | [] -> None
           | x::xs -> (match try_subset (x::partial_subset) xs with
                       | Some result -> Some result
                       | None -> try_subset partial_subset xs
                      )
    in try_subset [] lst


let subsetsum_option_v2 (lst: int list) : int list
  = let rec try_subset partial_subset rest =
      if rest = [] 
      then P.print_int_list partial_subset
      else () ;
      if sum partial_subset = 0 &&
           partial_subset <> [] &&
             rest = []
      then Some partial_subset
      else match rest with
           | [] -> None
           | x::xs -> (match try_subset (x::partial_subset) xs with
                       | Some result -> Some result
                       | None -> try_subset partial_subset xs
                      )
    in match try_subset [] lst with
       | Some result -> result
       | None -> []
         
let process_solution_option show s =
  print_endline ("Here is a solution: " ^ show s);
  print_endline ("Do you like it?");
  match String.sub (read_line ()) 0 1 with
  | "Y" | "y" -> print_endline "Thanks for playing!"; Some s
  | _ -> None

let subsetsum_option_v3 (lst: int list) : int list option
  = let rec try_subset partial_subset rest =
      if sum partial_subset = 0 &&
           partial_subset <> [] &&
             rest = []
      then process_solution_option
             (P.show_list string_of_int)
             partial_subset
      else match rest with
           | [] -> None
           | x::xs -> (match try_subset (x::partial_subset) xs with
                       | Some result -> Some result
                       | None -> try_subset partial_subset xs
                      )
    in try_subset [] lst
