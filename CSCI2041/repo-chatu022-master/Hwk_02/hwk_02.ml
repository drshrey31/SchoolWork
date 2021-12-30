(* This file contains a few helper functions and type declarations
   that are to be used in Homework 2. *)

(* Place part 1 functions 'take', 'drop', 'length', 'rev',
   'is_elem_by', 'is_elem', 'dedup', and 'split_by' here. *)

let rec take n ls = match ls with
 | [] -> []
 | x::rest -> if n > 0 then x::(take (n-1)) rest else []


let rec drop n ls = match ls with
 | [] -> []
 | x::rest -> if n > 0 then drop (n-1) rest else ls


let length ls = List.fold_left (fun a _ -> a + 1) 0 ls


let rev ls = List.fold_left (fun tls v -> v::tls) [] ls


let is_elem_by f target ls = List.fold_left (fun sum elem -> sum || f elem target) false ls


let is_elem target lst = is_elem_by (=) target lst


let dedup ls =
    List.fold_left (fun ls a -> if is_elem a ls then ls else a::ls) [] ls

(* ('a -> 'b -> bool) -> 'b list -> 'a list -> 'b list list *)
let split_by f vals splits =
    (* 'b -> 'b list list -> 'b list list
     * If the value (v) is in the list of splits, discard it and prepend an empty list
     * to the result. Otherwise prepend v to the first list in the result (insert v
     * into the first sublist). Special case when there is no first list in result. *)
    let next_segment v accum =
        match v, accum with
        | v, _ when is_elem_by f v splits -> []::accum
        | v, x::xs -> (v::x)::xs
        | v, [] -> [[v]]
    in
    List.fold_right next_segment vals [[]]

(* Part 2:  *)

(* Some functions for reading files. *)
let read_file (filename:string) : char list option =
  let rec read_chars channel sofar =
    try
      let ch = input_char channel
      in read_chars channel (ch :: sofar)
    with
    | _ -> sofar
  in
  try
    let channel = open_in filename
    in
    let chars_in_reverse = read_chars channel []
    in Some (rev chars_in_reverse)
  with
    _ -> None

type word = char list
type line = word list
type poem = (line * int) list


let convert_to_non_blank_lines_of_words textlist =
    let make_into_lines w ls =
        let make_into_words w ls =
            if (w = [])
                then ls
            else w :: ls
        in 
        (List.fold_right make_into_words (split_by (=) w [' '; '.'; '!'; '?'; ','; ';'; ':'; '-']) []) :: ls
    in 
    List.fold_right make_into_lines (split_by (=) textlist ['\n']) []

(* Part 3: Paradelle *)

(* Usable Funcs: *)
(* take, drop, read_chars
List.map, List.filter, List.fold_left, List.fold_right
List.sort, List.concat,
Char.lowercase_ascii, Char.uppercase_ascii
string_of_int *)

type result = OK
	    | FileNotFound of string
	    | IncorrectNumLines of int
	    | IncorrectLines of (int * int) list
	    | IncorrectLastStanza

(* Format Lines: 
1. Converts to char list list list
2. removes empty lines from lines of words
3. sets char list list list to lowercase *)
let format_lines txtls =
    let nonblank = convert_to_non_blank_lines_of_words txtls
    in
    let remove_empty_lines linels = List.fold_right (fun line ls -> if line = [] then ls else line::ls) linels []
    in
    List.map (List.map (List.map Char.lowercase_ascii)) (remove_empty_lines nonblank)


(* let full_check line par = 
    let index = 0 in
    if par = 1 then index = 6 
    else if par = 2 then index = 12
    else if par = 3 then index = 18
    else index = 18
    in
    let checker line idx = 
        if (get_nth line idx = get_nth line (idx + 1)) then 

        if a = b then []
        else [(num + inc1, num + inc2)]

    let check_1st = checker (l1,l2) (1,2) num
    in
    let check_2nd = checker (l3,l4) (3,4) num
    in
    let check_3rd = checker (l5,l6) (5,6) num
    in
    check_1st::check_2nd::check_3rd::[] *)


(* Check third stanza *)

(* let check_third stan num = 
    let index = if (num = 1) then 0 else if (num = 2) then 6 else 12
    in
    let  *)

let pl = 24
let sl = 6

let inc_last stan = 
    let s1 = format_lines stan in
    let first = List.sort compare (dedup (List.concat(take 18 s1))) 
    in
    let second = List.sort compare (dedup (List.concat(drop 18 s1))) 
    in
    first <> second


    (* line first = List.sort compare (dedup (List.concat(take 18)))
line second = List.sort compare (dedup (List.concat(drop 18)))
if (first = second) then Ok else incorrect stanza *)

let paradelle (filename: string) : result =
    let fname = read_file (filename)
    in
    match fname with
    | None  -> FileNotFound filename
    | Some ls -> let a = format_lines ls in
                 if (length a) != 24 then IncorrectNumLines (length a)
                 else if inc_last ls then IncorrectLastStanza else OK
  
   