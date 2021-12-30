(* A solution to exercise S7: #1 *)

(* Below, we generate all possible subsets of a set of values.
   Note that we are using lists to represent sets and simply
   assume that we do not have duplicates.  If this is a concern
   we could use a "dedup" function to remove duplicates.
   The important point here is to see that for each element in the
   list we have to make a choice - include it in the subset or do not
   include it.
   This leads to the two recursive calls, one that returns subsets
   with it, and one that returns subsets without it.
   See how the search tree we drew in class corresponds to the "call
   graph" of the functions?
 *)

 let s = [1; 3; -2; 5; -6]

 let rec gen_subsets (lst: 'a list) : 'a list list 
   = match lst with
     | [] -> [ [] ]
     | x::xs -> let rest_subsets : 'a list list = gen_subsets xs
                in rest_subsets @
                     List.map (fun ss -> x::ss) rest_subsets
 
 
 
 (* Some functions for converting lists into strings
    and printing them. *)
 let show_list show lst =
   "[" ^ String.concat "; " (List.map show lst) ^ "]"
 
 let show_lists show lsts =
   String.concat "\n" (List.map (show_list show) lsts)
 
 let print_int_list lst =
   print_endline ((show_list string_of_int) lst)
 
 let print_int_lists lsts =
   print_endline ((show_lists string_of_int) lsts)
       