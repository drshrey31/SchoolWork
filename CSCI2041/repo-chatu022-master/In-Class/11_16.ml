
              let rec listof n =
                match n with
                | 0 -> []
                | _ -> n :: listof (n-1)
               
               let rec append l1 l2 =
                match l1 with
                | [] -> l2
                | x::xs -> x :: (append xs l2)
               
               let rec rev lst =
                match lst with
                | [] -> []
                | x::xs -> append (rev xs) [x]
               
               
                             let rec listof n =
                match n with
                | 0 -> []
                | _ -> n :: listof (n-1)
               
               let rec append l1 l2 =
                match l1 with
                | [] -> l2
                | x::xs -> x :: (append xs l2)
               
               let rec rev lst =
                match lst with
                | [] -> []
                | x::xs -> append (rev xs) [x]
               
               
               let rec fib n = match n with
                | 0 -> 0
                | 1 -> 1
                | n -> fib (n-1) + fib (n-2)
               
               (* Exercise #3: What is the tail recursive version of the
                 fib function that uses accumulators to avoid all the 
                 recomputation?
                 What are the Fibonacci numbers?
                 nth: 0   1   2   3   4   5   6   7   8   9
                      0,  1,  1,  2,  3,  5,  8, 13, 21, 34
                                      ^   ^   ^ 
                                      |   |   |
                                      |   |___+
                                      |_______|      *)
               let fib' n =
                let rec f n1 n2 n' =
                  if n' = n
                  then n2
                  else f (n1 + n2) n1 (n'+1)
                in
                f 1 0 0