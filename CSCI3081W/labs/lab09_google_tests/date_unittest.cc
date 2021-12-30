#include "gtest/gtest.h"
#include "date.h"


class DateTest : public ::testing::Test {
 public:
  void SetUp( ) { 
    // code here will execute just before the test ensues 
	first_day = Date(2018, 9, 4);
	last_day = Date(2018, 12, 11);
  }
 protected:
  Date first_day;          // first day of classes
  Date last_day;           // last day of classes
};


TEST_F(DateTest, Test_GetDate_MissChars) {
  Date sample_test1(2001, 1, 1);             
  Date sample_test2(2025, 7, 4);            
  Date sample_test3(1994, 12, 6);    
  
  std::string expected_out_1 = "2001-01-01";
  std::string expected_out_2 = "2025-07-04";
  std::string expected_out_3 = "1994-12-06";
  
  testing::internal::CaptureStdout();
  std::cout<<sample_test1.GetDate();
  std::string output1 = testing::internal::GetCapturedStdout();
  
  testing::internal::CaptureStdout();
  std::cout<<sample_test2.GetDate();
  std::string output2 = testing::internal::GetCapturedStdout();
  
  testing::internal::CaptureStdout();
  std::cout<<sample_test3.GetDate();
  std::string output3 = testing::internal::GetCapturedStdout();
  
  EXPECT_EQ(output1, expected_out_1);
  EXPECT_EQ(output2, expected_out_2);
  EXPECT_EQ(output3, expected_out_3);
}


TEST_F(DateTest, Test_PrintDate_MissChars) {
  Date sample_test1(2001, 1, 1);             
  Date sample_test2(2025, 7, 4);            
  Date sample_test3(1994, 12, 6);    
  
  std::string expected_out_1 = "2001-01-01";
  std::string expected_out_2 = "2025-07-04";
  std::string expected_out_3 = "1994-12-06";
  
  testing::internal::CaptureStdout();
  sample_test1.PrintDate(false);
  std::string output1 = testing::internal::GetCapturedStdout();
  
  testing::internal::CaptureStdout();
  sample_test2.PrintDate(false);
  std::string output2 = testing::internal::GetCapturedStdout();
  
  testing::internal::CaptureStdout();
  sample_test3.PrintDate(false);
  std::string output3 = testing::internal::GetCapturedStdout();
  
  EXPECT_EQ(output1, expected_out_1);
  EXPECT_EQ(output2, expected_out_2);
  EXPECT_EQ(output3, expected_out_3);
}


TEST_F(DateTest, Test_PrintDate_Regular) {
  Date sample_test1(2001, 11, 11);             
  Date sample_test2(2025, 07, 14);            
  Date sample_test3(1994, 12, 16);    
  
  std::string expected_out_1 = "2001-11-11";
  std::string expected_out_2 = "2025-07-14";
  std::string expected_out_3 = "1994-12-16";
  
  testing::internal::CaptureStdout();
  sample_test1.PrintDate(false);
  std::string output1 = testing::internal::GetCapturedStdout();
  
  testing::internal::CaptureStdout();
  sample_test2.PrintDate(false);
  std::string output2 = testing::internal::GetCapturedStdout();
  
  testing::internal::CaptureStdout();
  sample_test3.PrintDate(false);
  std::string output3 = testing::internal::GetCapturedStdout();
  
  EXPECT_EQ(output1, expected_out_1);
  EXPECT_EQ(output2, expected_out_2);
  EXPECT_EQ(output3, expected_out_3);
}


TEST_F(DateTest, Test_GetUSDate) {
  
  Date sample_test1(2001, 1, 1);             
  Date sample_test2(2025, 7, 4);            
  Date sample_test3(1994, 12, 6);    
  
  std::string expected_out_1 = "01-01-2001";
  std::string expected_out_2 = "07-04-2025";
  std::string expected_out_3 = "12-06-1994";

  testing::internal::CaptureStdout();
  std::cout << sample_test1.GetUsDate();
  std::string output1 = testing::internal::GetCapturedStdout();
  
  testing::internal::CaptureStdout();
  std::cout << sample_test2.GetUsDate();
  std::string output2 = testing::internal::GetCapturedStdout();
  
  testing::internal::CaptureStdout();
  std::cout << sample_test3.GetUsDate();
  std::string output3 = testing::internal::GetCapturedStdout();

  EXPECT_EQ(output1, expected_out_1);
  EXPECT_EQ(output2, expected_out_2);
  EXPECT_EQ(output3, expected_out_3);
}

TEST_F(DateTest, Test_DateSubtraction) {
  Date sample_test1(2001, 1, 1);             
  Date sample_test2(2025, 7, 4);            
  Date sample_test3(1994, 12, 6);    
  
  std::string expected_out_1 = "1997-12-13";
  std::string expected_out_2 = "2025-06-22";
  std::string expected_out_3 = "1993-12-05";
  
  testing::internal::CaptureStdout();
  (sample_test1 - 1115).PrintDate(false);
  std::string output1 = testing::internal::GetCapturedStdout();
  
  testing::internal::CaptureStdout();
  (sample_test2 - 12).PrintDate(false);
  std::string output2 = testing::internal::GetCapturedStdout();
  
  testing::internal::CaptureStdout();
  (sample_test3 - 366).PrintDate(false);
  std::string output3 = testing::internal::GetCapturedStdout();
  
  EXPECT_EQ(output1, expected_out_1);
  EXPECT_EQ(output2, expected_out_2);
  EXPECT_EQ(output3, expected_out_3);
}

TEST_F(DateTest, Test_DateAddandSub) {
  Date sample_test1(2001, 1, 1);             
  Date sample_test2(2025, 7, 4);            
  Date sample_test3(1994, 12, 6);    
  
  std::string expected_out_1 = "2001-04-11";
  std::string expected_out_2 = "2024-12-16";
  std::string expected_out_3 = "1994-12-09";
  
  testing::internal::CaptureStdout();
  (sample_test1 + 100).PrintDate(false);
  std::string output1 = testing::internal::GetCapturedStdout();
  
  testing::internal::CaptureStdout();
  (sample_test2 - 200).PrintDate(false);
  std::string output2 = testing::internal::GetCapturedStdout();
  
  testing::internal::CaptureStdout();
  (sample_test3 + 3).PrintDate(false);
  std::string output3 = testing::internal::GetCapturedStdout();
  
  EXPECT_EQ(output1, expected_out_1);
  EXPECT_EQ(output2, expected_out_2);
  EXPECT_EQ(output3, expected_out_3);
}


TEST_F(DateTest, Test_Epoch) {
  Date test1(0);              
  Date test2(1865423569);                      
  Date test3(-186542356);         
  
  testing::internal::CaptureStdout();
  test1.PrintDate(false);
  std::string result1 = testing::internal::GetCapturedStdout();
  
  testing::internal::CaptureStdout();
  test2.PrintDate(false);
  std::string result2 = testing::internal::GetCapturedStdout();
  
  testing::internal::CaptureStdout();
  test3.PrintDate(false);
  std::string result3 = testing::internal::GetCapturedStdout();
  
  std::string correct_result_1 = "1970-01-01";
  std::string correct_result_2 = "2029-02-10";  
  std::string correct_result_3 = "1964-02-02"; 
  
  EXPECT_EQ(result1, correct_result_1);
  EXPECT_EQ(result2, correct_result_2); 
  EXPECT_EQ(result3, correct_result_3);
}

TEST_F(DateTest, Test_DaysBetween) {
  Date test1(2021, 3, 1);        
  Date test2(2021, 3, 31); 

  testing::internal::CaptureStdout();
  std::cout<<test2.DaysBetween(test1);

  std::string result = testing::internal::GetCapturedStdout();
  std::string correct_result_1 = "30"; 

  EXPECT_EQ(result, correct_result_1);
}


TEST_F(DateTest, IfPresentDatesCorrect_DateTests) {
  Date sample_test1;             
  
  std::string expected_out_1 = "2021-02-25"; 
  
  testing::internal::CaptureStdout();
  sample_test1.PrintDate(false);
  std::string output1 = testing::internal::GetCapturedStdout();
  
  EXPECT_EQ(output1, expected_out_1);
}

TEST_F(DateTest, IfDates60DaysApart_DateTests) {
  Date sample_test1(2016, 1, 1);             
  Date sample_test2(2032, 1, 1);               
  
  std::string expected_out_1 = "5844"; 
  
  testing::internal::CaptureStdout();
  std::cout<<sample_test2.DaysBetween(sample_test1);
  std::string output1 = testing::internal::GetCapturedStdout();
  
  EXPECT_EQ(output1, expected_out_1) << "Error: DaysBetween returned the wrong number of days. There are " << expected_out_1 << "between 1/1/2016 to 1/1/2032";
  
}

/*
*****************************
* Tests Originally given in the lab 
*/


TEST_F(DateTest, PrintDateTests) {
  Date y2k(1999, 12, 31);              // y2k
  Date ind_day(1776, 7, 4);            // US Independence
  Date best_holiday(2018, 10, 31);     // Halloween
  
  std::string expected_out_1 = "1999-12-31\n";
  std::string expected_out_2 = "1776-07-04\n";
  std::string expected_out_3 = "2018-10-31\n";
  
  testing::internal::CaptureStdout();
  y2k.PrintDate(true);
  std::string output1 = testing::internal::GetCapturedStdout();
  
  testing::internal::CaptureStdout(); // You must do this EVERY TIME, or else it will segfault
  ind_day.PrintDate(true);
  std::string output2 = testing::internal::GetCapturedStdout();
  
  testing::internal::CaptureStdout();
  best_holiday.PrintDate(true);
  std::string output3 = testing::internal::GetCapturedStdout();
  
  EXPECT_EQ(output1, expected_out_1);
  EXPECT_EQ(output2, expected_out_2);
  EXPECT_EQ(output3, expected_out_3);
}

TEST_F(DateTest, PrintDateTestsWithoutNewline) {
  Date y2k(1999, 12, 31);              // y2k
  Date ind_day(1776, 7, 4);            // US Independence
  Date best_holiday(2018, 10, 31);     // Halloween
  
  std::string expected_out_1 = "1999-12-31";
  std::string expected_out_2 = "1776-07-04";
  std::string expected_out_3 = "2018-10-31";
  
  testing::internal::CaptureStdout();
  y2k.PrintDate(false);
  std::string output1 = testing::internal::GetCapturedStdout();
  
  testing::internal::CaptureStdout();
  ind_day.PrintDate(false);
  std::string output2 = testing::internal::GetCapturedStdout();
  
  testing::internal::CaptureStdout();
  best_holiday.PrintDate(false);
  std::string output3 = testing::internal::GetCapturedStdout();
  
  EXPECT_EQ(output1, expected_out_1);
  EXPECT_EQ(output2, expected_out_2);
  EXPECT_EQ(output3, expected_out_3);
}

/**
  *
  * Note, this is the only provided test case which actually uses our test fixture
  * 
  * However, it is illegal to mix TEST() and TEST_F() in the same test case (file).
  *
  */
  
TEST_F(DateTest, DaysBetweenTests) {
  EXPECT_EQ(first_day.GetUsDate(), "09-04-2018") << "First day of class not setup properly";
  EXPECT_EQ(last_day.GetUsDate(), "12-11-2018") << "Last day of class not setup properly";
  EXPECT_EQ(first_day.DaysBetween(last_day), 98) << "Days between is not calculated properly";
}

/**
  *
  * NOPE!  Can't test PRIVATE methods
  *
  */
/*
TEST(DateTest, ConvertFromDays) {
	Date convert_first_day = ConvertToDays(2458365);
	EXPECT_STREQ(convert_first_day.GetUsDate(), "09-04-2018");
}
*/

