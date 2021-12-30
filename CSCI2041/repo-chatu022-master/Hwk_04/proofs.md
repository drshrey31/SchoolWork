# Homework 4: Reasoning about Correctness.

by Shreyas Chaturvedi

# Problem 1:

let rec prod = function
  | [] -> 1
  | y::ys -> y * prod ys

Using the definition above, we are to show by induction that prod (xs @ ys) = prod xs * prod ys for any two
integer lists xs and ys that can contain any integer value.

Base Case: 
    p([]) -> prod ([] @ ls) = prod ([]) * prod (ls)

Inductive Case: 
    p(x::xs) -> prod(x::xs @ ls) = prod(x::xs) * prod(ls)

Inductive Hypothesis: 
    p(xs) -> prod(xs @ ls) = prod(xs) * prod(ls)

Principle of Induction: 
    If the base case -> p([]) is true, and inductive case -> p(x::xs) is true for an int list xs, then p(xs, ys) -> prod(xs @ ys) = prod(xs) * prod(ys) is true for any two int lists xs and ys that can hold any int value.

Proof of Base Case: 
    prod ([] @ ls)

        = prod (ls) 
            definition of lists and the @ operator

        = 1 * prod (ls) 
            multiplicative identity of integers

        = prod[] * prod (ls) 
            definition of prod  

        true

Proof of Inductive Case:
        p (x::xs) -> prod (x::xs @ ls) = prod (x::xs) * prod (ls)

        prod (x::xs @ ls)
        = prod (x::(xs@ls)) 
            associative properties of the cons (::) and append (@) operators

        = x * prod (xs@ls) 
            definition of prod

        = x * prod (xs) * prod (ls) 
            inductive hypothesis
        = (x * prod (xs)) * prod (ls) 
            associative property of multiplication

        = prod(x::xs) * prod (ls) 
            definition of prod

        true

Therefore, since the base case -> p([]) is true, and the inductive case -> p(x::xs) is true, p(xs, ys) -> prod(xs @ ys) = prod(xs) * prod(ys) is true for any two int lists xs and ys that can hold any int value by the 
principle of induction. 

# Problem 2:

let rec sum = function
  | [] -> 0
  | y::ys -> y + sum ys

let rec length = function
  | [] -> 0
  | y::ys -> 1 + length ys

let rec inc_all = function
  | [] -> []
  | y::ys -> (y+1) :: inc_all ys

Using the definitions above, we are to prove by induction that sum (inc_all l) = length l + sum l for an
integer list l that can contain any integer x.

Base Case: 
    p([]) -> sum (inc_all []) = length [] + sum []


Inductive Case: 
    p(x::xs) -> sum (inc_all x::xs) = length x::xs + sum x::xs

Inductive Hypothesis: 
    p(xs) -> sum (inc_all xs) = length xs + sum xs

Principle of Induction: 
    If base case -> p([]) is true, and inductive case -> p(x::xs) is true for int list xs, then p(ls) is true for any int x in an int list ls.

Proof of Base Case: 

    p([]) -> sum (inc_all []) = length [] + sum []

    sum (inc_all [])

    = sum ([]) 
        definition of inc_all

    = 0
        definition of sum

    = 0 + 0
        zero addition identity

    = length [] + 0
        definition of length

    = length [] + sum []
        definition of sum

    true


Proof of Inductive Case:

    Ind Hyp -> sum (inc_all xs) = length xs + sum xs

    sum (inc_all x::xs)

    = sum (x+1::inc_all xs)
        definition of inc_all

    = x + 1 + sum (inc_all xs)
        definition of sum

    = x + 1 + length xs + sum xs
        inductive hypothesis

    = (1 + length xs) + (x + sum xs)
        associative property of addition

    = length x::xs + (x + sum xs)
        definition of length

    = length x::xs + sum x::xs
        definition of sum

    true

Therefore, since the base case -> p([]) is true, and inductive case -> p(x::xs) is true for xs, p(ls) is true for any int x in an int list ls using the principle of induction.

# Problem 3:

let rec map f l = match l with
  | [] -> []
  | y::ys -> f y :: map f ys

let inc x = x + 1

let rec inc_all = function
  | [] -> []
  | y::ys -> (y+1) :: inc_all ys

We are proving that map inc l = inc_all l for all ints x in int list l using the principle of induction.

Base Case: 
    p([]) -> map (inc []) = inc_all []

Inductive Case: 
    p(x::xs) -> map (inc x::xs) = inc_all x::xs

Inductive Hypothesis: 
    p(xs) -> map (inc xs) = inc_all xs

Principle of Induction: 
    If base case -> p([]) is true, and inductive case -> p(x::xs) is true for int list xs, then p(ls) is true for any int x in an int list ls.

Proof of Base Case: 

    p([]) -> map (inc []) = inc_all []

    map (inc [])

    = [] 
        definition of map
        
    = inc_all [] 
        definition of inc_all

    true

Proof of Inductive Case:

    We are seeking to prove that map (inc x::xs) = inc_all (x::xs)

    map (inc x::xs)

    = inc (x) :: map (inc (xs))
        definition of map

    = (x + 1) :: map (inc xs)
        definition of inc

    = (x + 1) :: inc_all (xs)
        inductive hypothesis

    = inc_all (x::xs)
        definition of inc_all
        
    true

Therefore, since base case -> p([]) is true, and inductive case -> p(x::xs) is true for int list xs, p(ls) is true for any int x in an int list ls using the principle of induction.

# Problem 4:

type 'a tree = Empty
             | Node of 'a * 'a tree * 'a tree

let rec to_list (t: 'a tree) : 'a list = match t with
  | Empty -> []
  | Node (v, tl, tr) -> to_list tl @ [v] @ to_list tr

let rec prod = function
  | [] -> 1
  | y::ys -> y * prod ys

let rec product (intree: int tree) : int =
  match intree with
  | Empty -> 1
  | Node (i, Empty, Empty) -> i
  | Node (i, t1, t2) -> i * product t1 * product t2


Using the definitions above, we are proving that prod (to_list t) = product t for all ints x in int tree t using the principle of induction.

Base Case: 
    p (Empty) ->  prod (to_list Empty) = product Empty

Inductive Case: 
    p (Node (v, tl, tr)) ->  prod (to_list (Node (v, tl, tr))) = product (Node (v, tl, tr))

Inductive Hypothesis: 
    p (t) ->  prod (to_list t) = product (t)

Principle of Induction: 
    If base case -> p (Empty) is true, and inductive case -> p (Node (v, tl, tr)) is true for int tree xs, 
    then p(t) is true for any int x in an int tree t.

Proof of Base Case: 
    prod (to_list Empty) = product Empty

    prod (to_list Empty)

    = prod ([])
        definition of to_list

    = 1
        definition of prod

    = product Empty
        definition of product

Proof of Inductive Case:

    We are proving that prod (to_list (Node (v, tl, tr))) = product (Node (v, tl, tr))

    prod (to_list (Node (v, tl, tr)))

    = prod (to_list tl @ [v] @ to_list tr)
        definition of to_list

    = prod ([v] @ to_list tl @ to_list tr)
        associative property of the append (@) operator
    
    = prod ([v] :: to_list tl @ to_list tr)
        interoperability of :: operator and @ operator
    
    = v * prod (to_list tl @ to_list tr)
        definition of prod
    
    = v * product (tl) * product (tr)
        in problem 1, we proved that prod(xs @ ls) = prod(xs) * prod(ls) for lists xs and ls

    = product (Node(v, tl, tr))
        definition of product
    
    true
    

Therefore, since the base case -> p (Empty) is true, and inductive case -> p (Node (v, tl, tr)) is true for int tree xs, p(t) is true for any int x in an int tree t by the principle of induction.


# Problem 5:

type 'a tree = Empty
             | Node of 'a * 'a tree * 'a tree

let rec size (tree: 'a tree) : int =
  match tree with
  | Empty -> 0
  | Node (a,t1,t2) -> 1 + size t1 + size t2

let rec reduce (b: 'b) (f: 'a -> 'b -> 'b -> 'b) (t: 'a tree) : 'b =
    match t with
    | Empty -> b
    | Node (v, t1, t2) -> f v (reduce b f t1) (reduce b f t2)

let size_r (tree: 'a tree): int = 
  let sizer l n1 n2 =  1 + n1 + n2
  in 
  reduce 0 sizer tree

Using the definitions above, we are proving that size(t) = size_r(t) for all ints x in int tree t using the principle of induction.

Base Case: 
    p (Empty) ->  size(Empty) = size_r(Empty)

Inductive Case: 
    p (Node (x, tl, tr)) ->  size(Node (x, tl, tr) = size_r(Node (x, tl, tr)

Inductive Hypothesis: 
    p (tree) -> size (tree) = size_r (tree)

Principle of Induction: 
    If base case -> p (Empty) is true, and inductive case -> p(Node (x, tl, tr)) is true, then p(t) is true for any int x in an int tree t.

Proof of Base Case: 

    size (Empty)
    
    = 0
        definition of size

    = reduce 0 f Empty
        definition of reduce

    = size_r Empty
        definition of size_r
    
    true

Proof of Inductive Case:

    size (Node (x, tl, tr))

    = 1 + size (tl) + size (tr)
        definition of size
    
    = 1 + size_r (tl) + size_r (tr)
        inductive hypothesis (applied twice)
    
    = sizer (x size_r(tl) size_r(tr))
        definition of size_r and sizer (helper method defined within size_r)
    
    = sizer (x (reduce 0 sizer tl) (reduce 0 sizer tr))
        definition of reduce (applied twice)

    = reduce 0 sizer (Node (x, tl, tr))
        definition of reduce
    
    = size_r (Node (x, tl, tr))
        definition of size_r
    
    true

Since the base case -> p (Empty) is true, and inductive case -> p(Node (x, tl, tr)) is true, p(t) is true for any int x in an int tree t using the principle of induction.





