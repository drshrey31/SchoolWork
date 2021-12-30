### Fuller Feedback for Lab 09

Run on February 25, 23:54:00 PM.

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



+ :heavy_check_mark:  Check that a GoogleTest test passes.
    passes the test: DateTest.IfPresentDatesCorrect_DateTests.



+ :heavy_check_mark:  Check that a GoogleTest test passes.
    passes the test: DateTest.IfDates60DaysApart_DateTests.



+ :heavy_check_mark:  Check that a GoogleTest test passes.
    passes the test: DateTest.PrintDateTests.



+ :heavy_check_mark:  Check that a GoogleTest test passes.
    passes the test: DateTest.PrintDateTestsWithoutNewline.



+ :heavy_check_mark:  Check that a GoogleTest test passes.
    passes the test: DateTest.DaysBetweenTests.



+ :heavy_check_mark:  100.0% of the tests passed. Expected at least 100%.

---


### Testing Mutants


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


#### Testing _mutant_constructor_no_add_1900_assess_new_ for failure

+ :heavy_check_mark:  Change into directory ".".

+ :heavy_check_mark:  Check that make clean compiles.



+ :heavy_check_mark:  Check that make  compiles.



+ :heavy_check_mark:  Check that make test compiles.



+ :heavy_check_mark:  Dynamic Check that file exists.

+ :heavy_check_mark:  At least one test failed for mutant_constructor_no_add_1900_assess_new

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

+ :heavy_check_mark:  100.0% of the tests passed. Expected at least 93%.

---

---

---

