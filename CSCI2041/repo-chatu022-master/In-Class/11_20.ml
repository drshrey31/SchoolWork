let rec filter (f: 'a -> bool) (s: 'a stream) : 'a stream =
  match s with
  | Cons (h, t) ->
     let rest = delay (fun () -> filter f (demand t)) in
     if f h
     then Cons (h, rest)
     else demand rest

let even n = n mod 2 = 0
let odd n = n mod 2 <> 0

let evens = filter even nats
let odds = filter odd nats

let rec map (f: 'a -> 'b) (s: 'a stream) : 'b stream =
  match s with
  | Cons (h, t) -> Cons (f h, delay (fun () -> map f (demand t) ) )

let odds_via_map = Cons (1, delay (fun () ->  map (fun n -> n + 1) evens ) )

let rec zip (f: 'a -> 'b ->'c) (s1: 'a stream) (s2: 'b stream) :
          'c stream =
  match s1, s2 with
  | Cons (h1, t1), Cons (h2, t2) ->
     Cons (f h1 h2, delay (fun () -> zip f (demand t1) (demand t2)))
                    
                                              
(* Computing factorials
   nats       = 1   2   3   4    5     6 
                 \   \   \   \    \     \
                  *   *   *   *    *     *
                   \   \   \   \    \     \
   factorials = 1-*-1-*-2-*-6-*-24-*-120-*-720
   We can define factorials recursively.  Each element in the stream
   is the product of then "next" natural number and the previous
   factorial.
 *)

let rec factorials () : int stream =
  Cons (1, delay (fun () -> zip ( * ) nats (factorials ())  ) )


(* Nov 13 *)

let rec sumToN n = match n with
    | 0 -> 0
    | _ -> n + sumToN (n-1)

let non_negs = from 0
let sumsTo_map = map sumToN non_negs

let () =
  assert (take 10 sumsTo_map = [0;1;3;6;10;15;21;28;36;45])

let rec sumsTo () =
  Cons (0, delay (fun () -> zip (+) nats (sumsTo ()) ))

let () =
  assert (take 10 (sumsTo ()) = [0;1;3;6;10;15;21;28;36;45])

let add_p x y =
  print_endline ("adding " ^ string_of_int x ^ " to " ^
                   string_of_int y ^ ".");
  x + y

let rec sumsTo_p () =
  Cons (0, delay (fun () -> zip add_p nats (sumsTo_p ()) ))

let () =
  assert (take 10 (sumsTo_p ()) = [0;1;3;6;10;15;21;28;36;45])

(*               nats
  sums = 0
         ^ + >   1    
         (=1)
         ^ + >   2
         (=3)
         ^ + >   3
         (=6)
         ...
 *)

(*
let rec sumsTo' =
  Cons (0, delay (fun () -> zip add_p nats sumsTo'))
*)

let sumsTo' =
  let dummy = ref nats
  in
  let sums = Cons (0, delay (fun () -> zip add_p nats (! dummy)))
  in
  let () = dummy := sums
  in
  sums

let () =
  assert (take 10 sumsTo' = [0;1;3;6;10;15;21;28;36;45])

