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

TEST_F(vector2DTest, Normalize) {
        sampleVector1->Normalize();
        sampleVector2->Normalize();
        EXPECT_FLOAT_EQ(sampleVector1->getX(), 0.52385974);
        EXPECT_FLOAT_EQ(sampleVector1->getZ(), 0.99965715);
        EXPECT_FLOAT_EQ(sampleVector2->getX(), 0.44721359);
        EXPECT_FLOAT_EQ(sampleVector2->getZ(), 0.97590011);
}

TEST_F(vector2DTest, Magnitude) {
        EXPECT_FLOAT_EQ(sampleVector1->getMagnitude(),23.479567);
        EXPECT_FLOAT_EQ(sampleVector2->getMagnitude(),2.236068);
}

TEST_F(vector2DTest, DotProduct) {
        Vector2D s1 = *sampleVector1;
        Vector2D s2 = *sampleVector2;
        EXPECT_FLOAT_EQ(s1.getDotProduct(s1),551.29004);
        EXPECT_FLOAT_EQ(s1.getDotProduct(s2),52.299999);
}

}