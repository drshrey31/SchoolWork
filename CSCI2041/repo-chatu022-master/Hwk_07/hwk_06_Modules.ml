open StreamModules

module type Hwk_06_Sig = sig
  type 'a stream
  val take: int -> 'a stream -> 'a list
  val head: 'a stream -> 'a
  val zip: ('a -> 'b -> 'c) -> 'a stream -> 'b stream -> 'c stream
  val from: int -> int stream
  val nats: int stream
  val cubes_from: int -> int stream
  val cubes_from_map: int -> int stream
  val cubes_from_zip: int -> int stream
  val facts: int stream
  val facts': int stream
  val primes: int stream
  

end

module Hwk_06 (S: StreamSig) : Hwk_06_Sig = struct

  type 'a lazee = 'a hidden ref

  and 'a hidden = Value of 'a 
                | Thunk of (unit -> 'a)

  let delay (unit_to_x: unit -> 'a) : 'a lazee = 
    ref (Thunk unit_to_x)

  let force (l: 'a lazee) : unit = match !l with
    | Value _ -> ()
    | Thunk f -> l := Value (f ())

  let demand (l: 'a lazee) : 'a = 
    force l; 
    match !l with
    | Value v -> v
    | Thunk f -> raise (Failure "this should not happen")

  (* Streams, using lazy values *)
  type 'a stream = Cons of 'a * 'a stream lazee


  (* Some examples streams from files developed in class. *)
  let rec from n =
    Cons ( n, delay ( fun () -> from (n+1) ) )

  let ones =
    let rec mk_ones () = Cons (1, delay ( mk_ones ) )
    in mk_ones ()

  let nats = from 1


  (* Some helpful functions from files developed in class. *)
  let head (s: 'a stream) : 'a = match s with
    | Cons (v, _) -> v

  let tail (s :'a stream) : 'a stream = match s with
    | Cons (_, tl) -> demand tl

  let rec take (n: int) (s: 'a stream) : 'a list =
    match n with
    | 0 -> []
    | _ -> (match s with
            | Cons (h, t) -> h :: take (n-1) (demand t) 
          )

  let rec filter (p: 'a -> bool) (s: 'a stream) : 'a stream =
    match s with
    | Cons (hd, tl) -> 
      let rest = delay (fun () -> filter p (demand tl)) in
      if p hd 
      then Cons (hd, rest)
      else demand rest

  let rec map (f: 'a -> 'b) (s: 'a stream) : 'b stream =
    match s with
    | Cons (h, t) -> Cons (f h, delay (fun () -> map f (demand t)))

  let rec zip (f: 'a -> 'b -> 'c) (s1: 'a stream) (s2: 'b stream) : 'c stream =
    match s1, s2 with
    | Cons (h1, t1), Cons (h2, t2) ->
      Cons (f h1 h2, delay (fun () -> zip f (demand t1) (demand t2)))


  (* Below is a stream of factorials.  It uses, the same definition of
    factorials as we developed in class except that the built in
    multiplication operator is replaced by a function `mul_p` that
    still multiplies its arguments but prints out those arguments as
    well.  *)

  let mul_p x y =
    let () = print_endline ("multiplying " ^ string_of_int x ^ " and " ^
                              string_of_int y ^ ".")
    in x * y

  let rec factorials () =
    Cons (1, delay (fun () -> zip mul_p nats (factorials ())))

  let facts = factorials ()


  let () =
    assert (take 5 facts = [1; 1; 2; 6; 24])

  (* Please write your solutions below. *)

  (* Cubes_from, Cubes_from_map, Cubes_from_zip *)

  let rec cubes_from (n: int) : int stream = 
    Cons ((n*n*n), delay (fun () -> cubes_from (n+1)))

  (* 
  Since cubes_from_map and cubes_from_zip aren't allowed to be recursive, in order to go through the list,
  I called on cubes_from, which is allowed to be recursive.
  *)

  let cubes_from_map (n: int) : int stream = 
    let vl x = x
    in
    map vl (Cons (n*n*n, delay (fun () : int stream -> map (fun x -> x) (cubes_from (n+1)))))

  let cubes_from_zip (n: int) : int stream = 
    let vl a b = a 
    in
    let cur = Cons (n*n*n, delay (fun () : int stream -> map (fun x -> x) (cubes_from (n+1))))
    in 
    zip vl cur cur

  let () =
    assert (take 5 (cubes_from 1) = [1; 8; 27; 64; 125]);
    assert (take 5 (cubes_from_map 1) = [1; 8; 27; 64; 125]);
    assert (take 5 (cubes_from_zip 1) = [1; 8; 27; 64; 125]);
    assert (take 3 (cubes_from 3) = [27; 64; 125]);
    assert (take 3 (cubes_from_map 3) = [27; 64; 125]);
    assert (take 3 (cubes_from_zip 3) = [27; 64; 125])

  (* facts' method *)

  let facts' =
    let dummy = ref nats
    in
    let factorials' = Cons (1, delay (fun () -> zip mul_p nats (! dummy)))
    in
    let () = dummy := factorials'
    in
    factorials'
  
  let () =
    assert (take 5 facts' = [1; 1; 2; 6; 24])
    
    (* 
    
    Explanation for facts':
    
    The delay within the facts method recursively calls on factorials from the start ( factorials () ), 
    which goes back to the first value in the nats list (which is 1 as defined in factorials) 
    and thus the multiplication starts over 
    every single time from the start. 
    
    In facts’ however, we dereference a ref to the current value in nats (dummy) when we 
    do the multiplication ( zip mul_p nats (! dummy) ), so therefore we start from 
    the current value in the nats list instead of from the beginning of the nats list 
    for every new multiplication. We set the value of the nats to the next value within the list 
    by changing the reference of dummy to point to factorials’. 
    So this way, we make sure to keep indexing the list by constantly changing the ref to the nats 
    and thus only compute the necessary components instead of starting over from the first element in nats 
    every single time. 
    
    *)

  (* Sieve and the sift helper *)

  let rec sift (n: int) (i : int stream) : int stream =
    if ((head i) mod n) != 0 
      then Cons ((head i), delay (fun () -> sift n (tail i)))
    else sift n (tail i)

  let rec sieve (i: int stream) : int stream =
    Cons((head i), delay(fun () -> sieve (sift (head i) (tail i))))

  let primes = sieve (from 2)

  let () =
    assert ( take 10 primes = [2; 3; 5; 7; 11; 13; 17; 19; 23; 29] )
end