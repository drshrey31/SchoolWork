# Hwk_08 Assessment

Run on December 19, 18:27:50 PM.

*Test results are for the code in this repository as it appeared on December 19 at 01:00 CT.*

+ Pass: Change into directory "Hwk_08".

+ Pass: Check that file "search_exceptions.ml" exists.

``Part 1``

+  _0_ / _2_ : Fail: 
Check that the result of evaluating
   ```ocaml
   List.mem [4; 2; 1; -7]
       (subsetsum_exn_ref_all [3; 4; -5; 2; 1; -7])
   ```
   matches the pattern `true`.

   


   Test failed. The following errors were reported:

   ```
    module P = PrintLists
    val s : int list = [1; 3; -2; 5; -6]
    val sum : int list -> int = <fun>
    exception FoundSet of int list
    val subsetsum_exn_on_found : int list -> int list option = <fun>
    exception KeepLooking
    val subsetsum_exn : int list -> int list option = <fun>
    val process_solution_exn : ('a list -> string) -> 'a list -> 'a list = <fun>
    val subsetsum_exn : int list -> int list option = <fun>
    val subsetsum_exn_continuation :
      int list -> (int list -> int list) -> int list option = <fun>
    val subsetsum_exn_v1 : int list -> int list option = <fun>
    val subsetsum_exn_first : int list -> int list option = <fun>
    val subsetsum_exn_all : int list -> int list option = <fun>
    val subsetsum_exn_ref_all : int list -> int list list = <fun>
    Exception: Assert_failure ("search_exceptions.ml", 172, 2).
    ```


+  _0_ / _2_ : Fail: 
Check that the result of evaluating
   ```ocaml
   List.mem [4; -5; 1]
       (subsetsum_exn_ref_all [3; 4; -5; 2; 1; -7])
   ```
   matches the pattern `true`.

   


   Test failed. The following errors were reported:

   ```
    module P = PrintLists
    val s : int list = [1; 3; -2; 5; -6]
    val sum : int list -> int = <fun>
    exception FoundSet of int list
    val subsetsum_exn_on_found : int list -> int list option = <fun>
    exception KeepLooking
    val subsetsum_exn : int list -> int list option = <fun>
    val process_solution_exn : ('a list -> string) -> 'a list -> 'a list = <fun>
    val subsetsum_exn : int list -> int list option = <fun>
    val subsetsum_exn_continuation :
      int list -> (int list -> int list) -> int list option = <fun>
    val subsetsum_exn_v1 : int list -> int list option = <fun>
    val subsetsum_exn_first : int list -> int list option = <fun>
    val subsetsum_exn_all : int list -> int list option = <fun>
    val subsetsum_exn_ref_all : int list -> int list list = <fun>
    Exception: Assert_failure ("search_exceptions.ml", 172, 2).
    ```


+  _0_ / _2_ : Fail: 
Check that the result of evaluating
   ```ocaml
   List.mem [3; -5; 2]
       (subsetsum_exn_ref_all [3; 4; -5; 2; 1; -7])
   ```
   matches the pattern `true`.

   


   Test failed. The following errors were reported:

   ```
    module P = PrintLists
    val s : int list = [1; 3; -2; 5; -6]
    val sum : int list -> int = <fun>
    exception FoundSet of int list
    val subsetsum_exn_on_found : int list -> int list option = <fun>
    exception KeepLooking
    val subsetsum_exn : int list -> int list option = <fun>
    val process_solution_exn : ('a list -> string) -> 'a list -> 'a list = <fun>
    val subsetsum_exn : int list -> int list option = <fun>
    val subsetsum_exn_continuation :
      int list -> (int list -> int list) -> int list option = <fun>
    val subsetsum_exn_v1 : int list -> int list option = <fun>
    val subsetsum_exn_first : int list -> int list option = <fun>
    val subsetsum_exn_all : int list -> int list option = <fun>
    val subsetsum_exn_ref_all : int list -> int list list = <fun>
    Exception: Assert_failure ("search_exceptions.ml", 172, 2).
    ```


+  _0_ / _2_ : Fail: 
Check that the result of evaluating
   ```ocaml
   List.mem [3; 4; -7]
       (subsetsum_exn_ref_all [3; 4; -5; 2; 1; -7])
   ```
   matches the pattern `true`.

   


   Test failed. The following errors were reported:

   ```
    module P = PrintLists
    val s : int list = [1; 3; -2; 5; -6]
    val sum : int list -> int = <fun>
    exception FoundSet of int list
    val subsetsum_exn_on_found : int list -> int list option = <fun>
    exception KeepLooking
    val subsetsum_exn : int list -> int list option = <fun>
    val process_solution_exn : ('a list -> string) -> 'a list -> 'a list = <fun>
    val subsetsum_exn : int list -> int list option = <fun>
    val subsetsum_exn_continuation :
      int list -> (int list -> int list) -> int list option = <fun>
    val subsetsum_exn_v1 : int list -> int list option = <fun>
    val subsetsum_exn_first : int list -> int list option = <fun>
    val subsetsum_exn_all : int list -> int list option = <fun>
    val subsetsum_exn_ref_all : int list -> int list list = <fun>
    Exception: Assert_failure ("search_exceptions.ml", 172, 2).
    ```


+  _0_ / _2_ : Fail: 
Check that the result of evaluating
   ```ocaml
   subsetsum_exn_ref_all [3; 4; -2; -9]
   ```
   matches the pattern `[]`.

   


   Test failed. The following errors were reported:

   ```
    module P = PrintLists
    val s : int list = [1; 3; -2; 5; -6]
    val sum : int list -> int = <fun>
    exception FoundSet of int list
    val subsetsum_exn_on_found : int list -> int list option = <fun>
    exception KeepLooking
    val subsetsum_exn : int list -> int list option = <fun>
    val process_solution_exn : ('a list -> string) -> 'a list -> 'a list = <fun>
    val subsetsum_exn : int list -> int list option = <fun>
    val subsetsum_exn_continuation :
      int list -> (int list -> int list) -> int list option = <fun>
    val subsetsum_exn_v1 : int list -> int list option = <fun>
    val subsetsum_exn_first : int list -> int list option = <fun>
    val subsetsum_exn_all : int list -> int list option = <fun>
    val subsetsum_exn_ref_all : int list -> int list list = <fun>
    Exception: Assert_failure ("search_exceptions.ml", 172, 2).
    ```


+  _3_ / _5_ : Pass: The function subsetsum_exn_ref_all uses OCaml references in an appropriate way and the function is a good effort at a solution

    2 points off for not using references

+ Pass: Check that file "search_wolf.ml" exists.

``Part 2``

+  _0_ / _10_ : Fail: 
Check that the result of evaluating
   ```ocaml
   
match (crossing_continuation (fun c -> Some c)) with
  | None -> false
  | Some c -> List.mem c
    [[(L, L, L, L); (R, L, R, L); (L, L, R, L); (R, L, R, R); (L, L, L, R);
      (R, R, L, R); (L, R, L, R); (R, R, R, R)];
     [(L, L, L, L); (R, L, R, L); (L, L, R, L); (R, R, R, L); (L, R, L, L);
      (R, R, L, R); (L, R, L, R); (R, R, R, R)]]

   ```
   matches the pattern `true`.

   


   Test failed. The following errors were reported:
   ```
    File "search_wolf.ml", line 199, characters 0-0:
    Error: Syntax error
    ```

+  _0_ / _10_ : Fail: 
Check that the result of evaluating
   ```ocaml
   
  List.sort compare (crossing_all ()) =
    [[(L, L, L, L); (R, L, R, L); (L, L, R, L); (R, L, R, R); (L, L, L, R);
      (R, R, L, R); (L, R, L, R); (R, R, R, R)];
     [(L, L, L, L); (R, L, R, L); (L, L, R, L); (R, R, R, L); (L, R, L, L);
      (R, R, L, R); (L, R, L, R); (R, R, R, R)]]

   ```
   matches the pattern `true`.

   


   Test failed. The following errors were reported:
   ```
    File "search_wolf.ml", line 199, characters 0-0:
    Error: Syntax error
    ```

+  _5_ / _5_ : Pass: crossing_continuation uses a continuation as required and the code is a reasonable attempt

    

+  _5_ / _5_ : Pass: crossing_all shows reasonable effort and uses a reference to hold the list of solutions

    

+ Pass: Check that file "twentyfour.ml" exists.

``Part 3``

+  _0_ / _5_ : Fail: 
Check that the result of evaluating
   ```ocaml
   rat_simplify (eval (BinOp (Rat (4,1), Add, Rat (3,1) ) ) )
   ```
   matches the pattern `(7, 1)`.

   


   Test failed. The following errors were reported:

   ```
    File "twentyfour.ml", line 101, characters 29-30:
    101 |   | x::xs -> Some build_expr (x) (xs)
                                       ^
    Error: Syntax error
    ```


+  _0_ / _5_ : Fail: 
Check that the result of evaluating
   ```ocaml
   rat_simplify (eval (BinOp (Rat (4,1), Div, Rat (3,1) ) ) )
   ```
   matches the pattern `(4, 3)`.

   


   Test failed. The following errors were reported:

   ```
    File "twentyfour.ml", line 101, characters 29-30:
    101 |   | x::xs -> Some build_expr (x) (xs)
                                       ^
    Error: Syntax error
    ```


+  _0_ / _5_ : Fail: 
Check that the result of evaluating
   ```ocaml
   try rat_simplify (eval (BinOp (Rat (4,1), Div, Rat (0,1) ) ) ) with
    | EvalError DivByZero -> (99,99)
   ```
   matches the pattern `(99,99)`.

   


   Test failed. The following errors were reported:

   ```
    File "twentyfour.ml", line 101, characters 29-30:
    101 |   | x::xs -> Some build_expr (x) (xs)
                                       ^
    Error: Syntax error
    ```


+  _0_ / _10_ : Fail: 
Check that the result of evaluating
   ```ocaml
   find_expr [(8,1); (3,1); (8,1); (3,1)]
   ```
   matches the pattern `Some (BinOp (Rat (8, 1), Div, BinOp (Rat (3, 1), Sub, BinOp (Rat (8, 1), Div, Rat (3, 1)))))`.

   


   Test failed. The following errors were reported:

   ```
    File "twentyfour.ml", line 101, characters 29-30:
    101 |   | x::xs -> Some build_expr (x) (xs)
                                       ^
    Error: Syntax error
    ```


+  _0_ / _10_ : Fail: 
Check that the result of evaluating
   ```ocaml
   match find_expr [(4,1); (2,1); (6,1); (3,1)] with
  | None -> false
  | Some e -> e = BinOp (Rat (4, 1), Add,
                         BinOp (Rat (2, 1), Add,
                                BinOp (Rat (6, 1), Mul, Rat (3, 1))))
              ||
              e = BinOp (Rat (4, 1), Mul,
                         BinOp (Rat (2, 1), Mul,
                                BinOp (Rat (6, 1), Sub, Rat (3, 1))))

   ```
   matches the pattern `true`.

   


   Test failed. The following errors were reported:

   ```
    File "twentyfour.ml", line 101, characters 29-30:
    101 |   | x::xs -> Some build_expr (x) (xs)
                                       ^
    Error: Syntax error
    ```


+  _0_ / _10_ : Fail: 
Check that the result of evaluating
   ```ocaml
   find_expr [(2,1); (3,1); (5,1); (7,1)]
   ```
   matches the pattern `None`.

   


   Test failed. The following errors were reported:

   ```
    File "twentyfour.ml", line 101, characters 29-30:
    101 |   | x::xs -> Some build_expr (x) (xs)
                                       ^
    Error: Syntax error
    ```


+  _5_ / _5_ : Pass: reasonable style and proper indentation

    

+  _5_ / _5_ : Pass: shows reasonable effort

    

#### Total score: _23_ / _100_

