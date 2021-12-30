# FUNCTION DEFINITIONS:
______________________________________________________________________________________________________________
____________________________________________________________________________________________________________

    let even x = x mod 2 = 0
            
    let rec all_evens (lst: int list) : int list =
    match lst with
    | [] -> []
    | x::xs when even x -> x :: (all_evens xs)
    | _::xs -> all_evens xs

    let rec filter (f: 'a -> bool) (lst: 'a list) : 'a list =
    match lst with
    | [] -> []
    | x::xs when f x -> x :: filter f xs
    | _::xs -> filter f xs


    let all_evens_f lst = filter even lst

We are seeking to prove that, for an int list ls that can contain any and every int value, all_evens ls = all_evens_f ls. We will use the principle of induction in order to write this proof. 
______________________________________________________________________________________________________________

# Principle of Induction: 
    
    We are asked to prove that for all e in 'a, 
    P(ls) -> all_evens (ls) = all_evens_f (ls) holds.

    If we prove the base case P([]) is true, and the inductive case P(e::xs) is true, then we will be able to conclude that all_evens ls = all_evens_f ls for all ints e in an int list ls.

______________________________________________________________________________________________________________

# Base Case: 
    
    P([]) -> all_evens [] = all_evens_f []

______________________________________________________________________________________________________________

# Inductive Case: 

    P(e::xs) -> all_evens e::xs = all_evens_f e::xs for all ints e.
______________________________________________________________________________________________________________

# Inductive Hypothesis:
    
    Ind Hyp -> Suppose that we have an int list xs for which all_evens xs = all_evens_f xs holds.
    
    Therefore: Assume P(xs) -> [all_evens xs = all_evens_f xs] is true.

______________________________________________________________________________________________________________
____________________________________________________________________________________________________________

# Proof of the Base Case: 

    #prove that all_evens [] = all_evens_f []

        LHS             RHS

    all_evens [] = all_evens_f [] 
    # using the definition of all_evens #

    all_evens [] = filter (even []) 
    # using the definition of all_evens_f #

    all_evens [] = []  
    # using the definition of filter #

    all_evens [] = all_evens []  
    # Using the definition of all_evens, in reverse #
    # Specifically: if lst = [] in all_evens lst, then |[] -> [] #

    true

______________________________________________________________________________________________________________
____________________________________________________________________________________________________________


# Proof of the Inductive Step: 

Assuming the inductive hypothesis holds true, we have to ensure that our inductive case P(e::xs) ->
all_evens e::xs = all_evens_f e::xs holds true for all possible ints.

There are two possible types of ints, therefore two cases: e is either even, or it is not even.

    1. e is even
    
    Ind Hyp -> all_evens xs = all_evens_f xs

    "all_evens e::xs = all_evens_f e::xs"   
    # starting point

        LHS                 RHS

    all_evens e::xs = filter (even e::xs)   
    # definition of all_evens_f

    all_evens e::xs = e :: filter (even xs)     
    # definition of even && definition of filter (e is even, so filter is true)

    all_evens e::xs = e :: all_evens_f xs     
    # definition of all_evens_f

    all_evens e::xs = e :: all_evens xs       
    # inductive hypothesis

    all_evens e::xs = all_evens e::xs       
    # definition of all_evens

    true
   

    2. e is not even

    Ind Hyp -> all_evens xs = all_evens_f xs

    "all_evens e::xs = all_evens_f e::xs"   
    # starting point

         LHS                 RHS

    all_evens e::xs = filter (even e::xs)   
    # definition of all_evens_f

    all_evens e::xs = filter (even xs)     
    # definition of even && definition of filter (e is not even, so filter is false)
                                                                                                    
    all_evens e::xs = all_evens_f xs     
    # definition of all_evens_f

    all_evens e::xs = all_evens xs       
    # inductive hypothesis

    all_evens e::xs = all_evens e::xs         
    
    # definition of all_evens, used in reverse and properties of lists
    # specific case: all_evens _::xs -> all_evens xs
    # here, all_evens e::xs -> all_evens xs, since e is not even, 
    # and therefore falls in the pattern of _::xs

    true 

______________________________________________________________________________________________________________

Therefore, since we proved that our base case P([]) is true, and we proved that the 
inductive step P(e::xs) is true, then by the principle of induction, we can arrive at the conclusion that all_evens ls = all_evens_f ls for an ls that can contain any possible int value e.
______________________________________________________________________________________________________________