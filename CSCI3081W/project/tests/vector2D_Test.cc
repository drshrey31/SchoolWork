#include "gtest/gtest.h"
#include <EntityProject/project_settings.h>
#include "../include/delivery_simulation.h"
#include <EntityProject/entity.h>
#include "json_helper.h"
#include "vector2D.h"
#include <iostream>

namespace csci3081 {


class vector2DTest : public ::testing::Test {
protected:
  virtual void SetUp() {
    default_position = new Vector2D();
    
    sampleVector1 = new Vector2D(12.3, 0, 20.0);
    dummyVector = new Vector2D(12.3, 0, 20.0);

    sampleVector2 = new Vector2D(1.0, 0, 2.0);


  }
  virtual void TearDown(){}
  
  Vector2D *default_position;
  Vector2D *sampleVector1;
  Vector2D *dummyVector;
  Vector2D *sampleVector2;
  
};

/*******************************************************************************
 * vector2DTest
 ******************************************************************************/

TEST_F(vector2DTest, Constructor){
    EXPECT_FLOAT_EQ(default_position->getX(), 0);
    EXPECT_FLOAT_EQ(default_position->getZ(), 0);
}

TEST_F(vector2DTest, OverloadedCons){
    Vector2D *sampleVector = new Vector2D(12.3,0,20.0);
    EXPECT_FLOAT_EQ(sampleVector->getX(), 12.3);
    EXPECT_FLOAT_EQ(sampleVector->getZ(), 20.0);
    //delete sampleVector;
}

TEST_F(vector2DTest, FloatVec){
    std::vector<float> test_vec = {12.3,0,20.0};
    Vector2D *sampleVector = new Vector2D(test_vec);
    EXPECT_FLOAT_EQ(sampleVector->getX(), test_vec[0]);
    EXPECT_FLOAT_EQ(sampleVector->getZ(), test_vec[2]);
    //delete sampleVector;
}

TEST_F(vector2DTest, CopyMethod){
    Vector2D *sampleVector1 = new Vector2D(12.3,16.6,20.0);
    Vector2D *sampleVector2 = new Vector2D(1.0,1.5,2.0);
    sampleVector1 = sampleVector2;
    EXPECT_FLOAT_EQ(sampleVector1->getX(), 1.0);
    EXPECT_FLOAT_EQ(sampleVector1->getZ(), 2.0);
}

TEST_F(vector2DTest, Setter){
    default_position->setX(5.6);
    default_position->setZ(2.3);
    EXPECT_FLOAT_EQ(default_position->getX(), 5.6);
    EXPECT_FLOAT_EQ(default_position->getZ(), 2.3);
}

}