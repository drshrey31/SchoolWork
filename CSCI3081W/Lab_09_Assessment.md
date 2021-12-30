### Assessment for Lab 09

#### Total score: _86.26_ / _100_

Run on March 31, 21:38:30 PM.

+ :heavy_check_mark:  Run git ls-remote to check for existence of specific branch- Branch master found

+ :heavy_check_mark:  Checkout master branch.




#### System Files and Lab Directory Structure

+ :heavy_check_mark:  Check that directory "labs" exists.

+ :heavy_check_mark:  Check that directory "labs/lab09_google_tests" exists.

+ :heavy_check_mark:  Check that file/directory "labs/lab09_google_tests/date" does not exist.

+ :heavy_check_mark:  Check that file/directory "labs/lab09_google_tests/date_unittest" does not exist.

---


#### Essential Files Exist

+ :heavy_check_mark:  Check that file "./labs/lab09_google_tests/date_unittest.cc" exists.

---


### Testing correct implementation

+ :heavy_check_mark:  Change into directory "./labs/lab09_google_tests".

+ :heavy_check_mark:  overwriting makefile



+ :heavy_check_mark:  overwriting makefile



+ :heavy_check_mark:  overwriting header



+ :heavy_check_mark:  overwriting cc1



+ :heavy_check_mark:  overwriting cc2



+ :heavy_check_mark:  correct version



+ :heavy_check_mark:  correct version



+ :heavy_check_mark:  correct version



+ :heavy_check_mark:  Copy file "Copying official project makefile".



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that file "date_unittest" exists.

+ :heavy_check_mark:  Get all google tests.
    13 tests found.




#### Results

+ :heavy_check_mark:  Check that a GoogleTest test passes.
    passes the test: DateTest.Test_GetDate_MissChars.



+ :heavy_check_mark:  Check that a GoogleTest test passes.
    passes the test: DateTest.Test_PrintDate_MissChars.



+ :heavy_check_mark:  Check that a GoogleTest test passes.
    passes the test: DateTest.Test_PrintDate_Regular.



+ :heavy_check_mark:  Check that a GoogleTest test passes.
    passes the test: DateTest.Test_GetUSDate.



+ :heavy_check_mark:  Check that a GoogleTest test passes.
    passes the test: DateTest.Test_DateSubtraction.



+ :heavy_check_mark:  Check that a GoogleTest test passes.
    passes the test: DateTest.Test_DateAddandSub.



+ :heavy_check_mark:  Check that a GoogleTest test passes.
    passes the test: DateTest.Test_Epoch.



+ :heavy_check_mark:  Check that a GoogleTest test passes.
    passes the test: DateTest.Test_DaysBetween.



+ :x:  Check that a GoogleTest test passes.
    fails the test: DateTest.IfPresentDatesCorrect_DateTests.
<pre>
[ RUN      ] DateTest.IfPresentDatesCorrect_DateTests
date_unittest.cc:228: Failure
Expected equality of these values:
  output1
    Which is: "2021-03-31"
  expected_out_1
    Which is: "2021-02-25"</pre>


+ :heavy_check_mark:  Check that a GoogleTest test passes.
    passes the test: DateTest.IfDates60DaysApart_DateTests.



+ :heavy_check_mark:  Check that a GoogleTest test passes.
    passes the test: DateTest.PrintDateTests.



+ :heavy_check_mark:  Check that a GoogleTest test passes.
    passes the test: DateTest.PrintDateTestsWithoutNewline.



+ :heavy_check_mark:  Check that a GoogleTest test passes.
    passes the test: DateTest.DaysBetweenTests.



+ :x:  _36.92_ / _40_ :  92.31% of the tests passed, but the target is 100%.

---


### Testing Mutants


#### Testing _mutant_op_minus_arithmetic_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_op_minus_arithmetic

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_return_1_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_return_1_assess_new

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_arithmetic_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_arithmetic

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_get_date_separator_omit_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_get_date_separator_omit

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_print_date_no_leading_zeroes_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_print_date_no_leading_zeroes

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_epoch_constructor_year_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_epoch_constructor_year

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_print_us_date_no_leading_zeroes_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_print_us_date_no_leading_zeroes_assess (since all tests pass).
   - Reason - Some dates don't have leading zeroes

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_param_constructor_month_index_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_param_constructor_month_index

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_abs_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_abs_assess

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_constructor_month_index_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_constructor_month_index (since all tests pass).
   - Reason - Today's date month off by one

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_plus_add_one_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_op_plus_add_one_assess_new

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_minus_no_leap_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_op_minus_no_leap_assess

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_plus_no_leap_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_op_plus_no_leap_assess (since all tests pass).
   - Reason - 2016-02-27 + 2 should be 2016-02-29, but this version prints 2016-03-01

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_get_us_date_wrong_format_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_get_us_date_wrong_format

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_no_leap_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_no_leap

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_constructor_no_add_1900_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_constructor_no_add_1900_assess_new (since all tests pass).
   - Reason - Date which should be Jan 1, 2000 is actually Jan 1, 100.

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_param_constructor_swap_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_param_constructor_swap_assess_new

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_minus_arithmetic_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_op_minus_arithmetic

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_return_1_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_return_1_assess_new

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_arithmetic_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_arithmetic

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_get_date_separator_omit_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_get_date_separator_omit

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_print_date_no_leading_zeroes_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_print_date_no_leading_zeroes

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_epoch_constructor_year_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_epoch_constructor_year

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_print_us_date_no_leading_zeroes_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_print_us_date_no_leading_zeroes_assess (since all tests pass).
   - Reason - Some dates don't have leading zeroes

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_param_constructor_month_index_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_param_constructor_month_index

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_abs_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_abs_assess

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_constructor_month_index_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_constructor_month_index (since all tests pass).
   - Reason - Today's date month off by one

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_plus_add_one_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_op_plus_add_one_assess_new

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_minus_no_leap_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_op_minus_no_leap_assess

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_plus_no_leap_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_op_plus_no_leap_assess (since all tests pass).
   - Reason - 2016-02-27 + 2 should be 2016-02-29, but this version prints 2016-03-01

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_get_us_date_wrong_format_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_get_us_date_wrong_format

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_no_leap_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_no_leap

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_constructor_no_add_1900_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_constructor_no_add_1900_assess_new (since all tests pass).
   - Reason - Date which should be Jan 1, 2000 is actually Jan 1, 100.

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_param_constructor_swap_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_param_constructor_swap_assess_new

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_minus_arithmetic_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_op_minus_arithmetic

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_return_1_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_return_1_assess_new

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_arithmetic_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_arithmetic

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_get_date_separator_omit_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_get_date_separator_omit

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_print_date_no_leading_zeroes_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_print_date_no_leading_zeroes

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_epoch_constructor_year_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_epoch_constructor_year

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_print_us_date_no_leading_zeroes_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_print_us_date_no_leading_zeroes_assess (since all tests pass).
   - Reason - Some dates don't have leading zeroes

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_param_constructor_month_index_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_param_constructor_month_index

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_abs_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_abs_assess

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_constructor_month_index_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_constructor_month_index (since all tests pass).
   - Reason - Today's date month off by one

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_plus_add_one_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_op_plus_add_one_assess_new

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_minus_no_leap_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_op_minus_no_leap_assess

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_plus_no_leap_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_op_plus_no_leap_assess (since all tests pass).
   - Reason - 2016-02-27 + 2 should be 2016-02-29, but this version prints 2016-03-01

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_get_us_date_wrong_format_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_get_us_date_wrong_format

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_no_leap_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_no_leap

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_constructor_no_add_1900_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_constructor_no_add_1900_assess_new (since all tests pass).
   - Reason - Date which should be Jan 1, 2000 is actually Jan 1, 100.

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_param_constructor_swap_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_param_constructor_swap_assess_new

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_minus_arithmetic_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_op_minus_arithmetic

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_return_1_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_return_1_assess_new

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_arithmetic_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_arithmetic

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_get_date_separator_omit_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_get_date_separator_omit

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_print_date_no_leading_zeroes_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_print_date_no_leading_zeroes

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_epoch_constructor_year_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_epoch_constructor_year

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_print_us_date_no_leading_zeroes_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_print_us_date_no_leading_zeroes_assess (since all tests pass).
   - Reason - Some dates don't have leading zeroes

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_param_constructor_month_index_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_param_constructor_month_index

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_abs_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_abs_assess

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_constructor_month_index_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_constructor_month_index (since all tests pass).
   - Reason - Today's date month off by one

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_plus_add_one_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_op_plus_add_one_assess_new

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_minus_no_leap_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_op_minus_no_leap_assess

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_plus_no_leap_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_op_plus_no_leap_assess (since all tests pass).
   - Reason - 2016-02-27 + 2 should be 2016-02-29, but this version prints 2016-03-01

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_get_us_date_wrong_format_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_get_us_date_wrong_format

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_no_leap_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_no_leap

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_constructor_no_add_1900_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_constructor_no_add_1900_assess_new (since all tests pass).
   - Reason - Date which should be Jan 1, 2000 is actually Jan 1, 100.

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_param_constructor_swap_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_param_constructor_swap_assess_new

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_minus_arithmetic_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_op_minus_arithmetic

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_return_1_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_return_1_assess_new

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_arithmetic_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_arithmetic

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_get_date_separator_omit_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_get_date_separator_omit

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_print_date_no_leading_zeroes_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_print_date_no_leading_zeroes

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_epoch_constructor_year_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_epoch_constructor_year

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_print_us_date_no_leading_zeroes_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_print_us_date_no_leading_zeroes_assess (since all tests pass).
   - Reason - Some dates don't have leading zeroes

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_param_constructor_month_index_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_param_constructor_month_index

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_abs_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_abs_assess

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_constructor_month_index_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_constructor_month_index (since all tests pass).
   - Reason - Today's date month off by one

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_plus_add_one_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_op_plus_add_one_assess_new

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_minus_no_leap_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_op_minus_no_leap_assess

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_plus_no_leap_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_op_plus_no_leap_assess (since all tests pass).
   - Reason - 2016-02-27 + 2 should be 2016-02-29, but this version prints 2016-03-01

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_get_us_date_wrong_format_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_get_us_date_wrong_format

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_no_leap_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_no_leap

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_constructor_no_add_1900_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_constructor_no_add_1900_assess_new (since all tests pass).
   - Reason - Date which should be Jan 1, 2000 is actually Jan 1, 100.

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_param_constructor_swap_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_param_constructor_swap_assess_new

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_minus_arithmetic_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_op_minus_arithmetic

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_return_1_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_return_1_assess_new

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_arithmetic_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_arithmetic

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_get_date_separator_omit_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_get_date_separator_omit

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_print_date_no_leading_zeroes_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_print_date_no_leading_zeroes

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_epoch_constructor_year_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_epoch_constructor_year

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_print_us_date_no_leading_zeroes_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_print_us_date_no_leading_zeroes_assess (since all tests pass).
   - Reason - Some dates don't have leading zeroes

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_param_constructor_month_index_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_param_constructor_month_index

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_abs_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_abs_assess

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_constructor_month_index_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_constructor_month_index (since all tests pass).
   - Reason - Today's date month off by one

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_plus_add_one_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_op_plus_add_one_assess_new

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_minus_no_leap_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_op_minus_no_leap_assess

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_op_plus_no_leap_assess_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_op_plus_no_leap_assess (since all tests pass).
   - Reason - 2016-02-27 + 2 should be 2016-02-29, but this version prints 2016-03-01

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_get_us_date_wrong_format_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_get_us_date_wrong_format

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_days_between_no_leap_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_days_between_no_leap

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_constructor_no_add_1900_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :x:  There is no test case for mutant_constructor_no_add_1900_assess_new (since all tests pass).
   - Reason - Date which should be Jan 1, 2000 is actually Jan 1, 100.

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---


#### Testing _mutant_param_constructor_swap_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_param_constructor_swap_assess_new

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Change into directory ".".

---

+ :x:  _49.34_ / _60_ :  76.47% of the tests passed, but the target is 93%.

---

---

#### Total score: _86.26_ / _100_

---

