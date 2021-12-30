#use "hwk_02.ml" ;;


assert (length [] = 0) ;;
assert (length [1;2;3] = 3) ;;
assert (length ['a'; 'b'; '5'] = 3) ;;
assert (length [12;4;2131;2;321;3;21;3] = 8) ;;
print_string "Tests for length passed." ;;


assert (rev [1;2;3] = [3;2;1]) ;;
assert (rev [432;423;12;21;321] = [321;21;12;423;432]) ;;
assert (rev [] = []) ;;
assert (rev ['a'] = ['a']) ;;
print_string "Tests for rev passed." ;;


assert (is_elem_by (=) 4 [1; 2; 3; 4; 5; 6; 7] = true) ;;
assert (is_elem_by (fun c i -> Char.code c = i) 99 ['a'; 'b'; 'c'; 'd'] = true) ;;
print_string "Tests for is_elem_by passed." ;;


assert (is_elem 4 [1; 2; 3; 4; 5; 6; 7] = true) ;;
assert (is_elem 4 [1; 2; 3; 5; 6; 7] = false) ;;
assert (is_elem 4 [] = false) ;;
print_string "Tests for is_elem passed." ;;


assert (dedup [] = []) ;;
assert (Sort.list (<) (dedup [3;4]) = Sort.list (<) [3;4]) ;;
assert (Sort.list (<) (dedup [4;4;4;4;4]) = [4]) ;;
assert (Sort.list (<) (dedup [3;33;5;3;4;2;1;4;3;2;1]) = Sort.list (<) [3;33;5;4;2;1]) ;;
print_string "Tests for dedup passed." ;;


assert (split_by (=) [1;2;3;4;5;6;7;8;9;10;11] [3;7] = [[1; 2]; [4; 5; 6]; [8; 9; 10; 11]]) ;;
assert (split_by (=) [1;2;3;3;3;4;5;6;7;7;7;8;9;10;11] [3;7] = [[1; 2]; []; []; [4; 5; 6]; []; []; [8; 9; 10; 11]]) ;;
assert (split_by (=) ["A"; "B"; "C"; "D"] ["E"] = [["A"; "B"; "C"; "D"]]) ;;
print_string "Tets for split_by passed." ;;


assert (paradelle "not_a_paradelle_emma_1.txt" != OK) ;;
assert (paradelle "not_a_paradelle_empty_file.txt" != OK) ;;
assert (paradelle "not_a_paradelle_susan_1.txt" != OK) ;;
assert (paradelle "not_a_paradelle_susan_2.txt" != OK) ;;
assert (paradelle "not_a_paradelle_susan_3.txt" != OK) ;;
assert (paradelle "not_a_paradelle_wrong_line_count.txt" != OK) ;;
assert (paradelle "jfldsaflkds.txt" != OK) ;;
assert (paradelle "paradelle_emma_1.txt" = OK) ;;
assert (paradelle "paradelle_susan_1.txt" = OK) ;;
assert (paradelle "paradelle_susan_2.txt" = OK) ;;


print_string "All tests passed." ;;
