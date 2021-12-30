(* Binomial heaps 
   Another heap data structure.
 *)

 type 'a tree = Node of int * 'a * 'a tree list
 (* trees have 2^r, r being the rank, values 
    trees lists in decreasing rank order *)
 
 type 'a heap = 'a tree list
 (* trees in a heap are listed in increasing rank order *)
 
 (* 5 = 101 in binary *)
 let rank (Node (r, _, _)) = r
 let root (Node (_, x, _)) = x
 
 let link (t1: 'a tree) (t2: 'a tree) : ' a tree =
   assert (rank t1 = rank t2);
   match t1, t2 with
   | Node (r, x1, c1), Node (_, x2, c2) ->
      if x1 <= x2
      then Node (r+1, x1, t2 :: c1)
      else Node (r+1, x2, t1 :: c2)
 
 let rec insertTree (t: 'a tree) (ts: 'a heap) : 'a heap =
   match t, ts with
   | _, [] -> [t]
   | _, t'::ts' ->
      if rank t < rank t'
      then t :: ts
      else (assert (rank t = rank t');
            insertTree (link t t') ts'
           )
      (* we must ensure that the rank of t and t' are equal,
         our use of insertTree will ensure this. *)
 
 let insert (x: 'a) (h: 'a heap) : 'a heap =
   insertTree (Node (0, x, [])) h
 (* inserting a value into a heap is like adding 1 to a
    binary number.
    We may need to carry values.
    1 + 11 = 100
   11
    11
  +  1
 --------
   1 0 0 *)
 
 
 (* inserting 30, 20, 10, 40 into the empty heap []
 1. insert 30 in []
 -> [ Node (0, 30, []) ]
 2. insert 20 into [ Node (0, 30, []) ]
 -> Node (0, 20, [])  -it-> [ Node (0, 30, []) ]
 -> [ Node (1, 20, [Node (0, 30, []) ] ) ]
 3. insert 10 into above
 -> Node (0, 10, []) -it> [ Node (1, 20, [ Node (0, 30, []) ]
 -> [ Node (0, 10, []) ; Node (1, 20, [ Node (0, 30, []) ]
 4. insert 40 into above
 -> Node (0, 40, []) -it> [ Node (0, 10, []) ; 
                            Node (1, 20, [ Node (0, 30, []) ]
    this is adding 1 to 3, we should get 4, a tree of rank 2
 -> Node (1, 10, [Node (0, 40, [])]) -it> [ Node (1, 20, [ Node (0, 30,[]) ]
    this is adding 2 + 2
 -> Node (2, 10, [ Node (1, 20, [ Node (0, 30, []) ]) ; Node (0, 40, []) ]
    this is a rank 2 tree as seen in 3.3
  *)
 
 let h0 = []
 let h1 = insert 30 h0
 let h2 = insert 20 h1
 let h3 = insert 10 h2
 let h4 = insert 40 h3
     
 let rec merge (ts1: 'a heap) (ts2: 'a heap) : 'a heap =
   match ts1, ts2 with
   | _, [] -> ts1
   | [], _ -> ts2
   | t1::ts1', t2::ts2' ->
      if rank t1 < rank t2
      then t1 :: merge ts1' ts2
      else if rank t1 > rank t2
      then t2 :: merge ts2' ts1
      else insertTree (link t1 t2) (merge ts1' ts2')
 
 (* merge h3 with [ Node (0, 15, []) ]
 merge
 [ Node (0, 10, []) ; Node (1, 20, [ Node (0, 30, []) ]
 [ Node (0, 15, []) ]
   Node (1, 10, [ Node (0, 15, []) ]) -it> 
     [  Node (1, 20, [ Node (0, 30, []) ]) ]
  Node (2, 10, [ Node (1, 20, [ Node (0, 30, []) ]) ; Node (0, 15, []) ])
  *)
 let h5 = merge h3 [ Node (0, 15, []) ]
 
 let rec removeMinTree (ts': 'a heap) : 'a tree * 'a heap =
  match ts' with
  | [] -> failwith "removeMinTree on empty heap"
  | [t] -> (t, [])
  | t::ts ->
     let (t', ts') = removeMinTree ts
     in  if root t < root t'
         then (t, ts)
         else (t', t::ts')
 
 let findMin (ts: 'a heap) =
   let (t, _) = removeMinTree ts
   in root t