(* Constructing lazy values in OCaml, using them in streams *)

let print (n:int) = print_string "Your number is ";
                    print_int n;
                    print_endline "!"

let delayed_print (n:int) = fun () -> print n                      

type 'a hidden = Value of 'a
               | Thunk of (unit -> 'a)

type 'a lazee = 'a hidden ref

let delay (unit_to_x: unit -> 'a) : 'a lazee =
  ref ( Thunk unit_to_x )

let force (l: 'a lazee) : unit = match !l with
  | Value _ -> ()
  | Thunk f -> l := Value (f ())

let demand (l: 'a lazee) : 'a =
  force l;
  match !l with
  | Value v -> v
  | Thunk _ -> failwith "This should not happen."

type 'a stream = Cons of 'a * 'a stream lazee

let rec from n =
  print_endline ("step " ^ string_of_int n);
  Cons (n, delay (fun () -> from (n+1) ) )

let nats = from 1

let head (s: 'a stream) : 'a = match s with
    | Cons (h, _) -> h
let tail (s: 'a stream) : 'a stream = match s with
    | Cons (_, t) -> demand t
                   
let rec take (n: int) (s: 'a stream) : 'a list =
  match n with
  | 0 -> []
  | _ -> (match s with
          | Cons (h, t) -> h :: take (n-1) (demand t)
         )

let rec squares_from (n: int) : int stream =
  Cons ( n*n, delay (fun () -> squares_from (n+1)) )
