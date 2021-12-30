#include "gtest/gtest.h"
#include <EntityProject/project_settings.h>
#include "../include/delivery_simulation.h"
#include <EntityProject/entity.h>
#include "json_helper.h"
#include "vector3D.h"
#include <iostream>

namespace csci3081 {


class Vector3D_Test : public ::testing::Test {
protected:
  virtual void SetUp() {
    standard = new Vector3D();
  }
  virtual void TearDown() {
    //delete standard;
  }
  Vector3D *standard;
};

/*******************************************************************************
 * Test Cases
 ******************************************************************************/

TEST_F(Vector3D_Test, DefaultConstructor){
    EXPECT_FLOAT_EQ(standard->getX(), 0);
    EXPECT_FLOAT_EQ(standard->getY(), 0);
    EXPECT_FLOAT_EQ(standard->getZ(), 0);
}

TEST_F(Vector3D_Test, ChangeableConstructor){
    Vector3D *manual = new Vector3D(3.1,9.4,1.8);
    EXPECT_FLOAT_EQ(manual->getX(), 3.1);
    EXPECT_FLOAT_EQ(manual->getY(), 9.4);
    EXPECT_FLOAT_EQ(manual->getZ(), 1.8);
}

TEST_F(Vector3D_Test, CopyMethod){
    Vector3D *vec1 = new Vector3D(3.1,9.4,1.8);
    Vector3D *vec2 = new Vector3D(91.0,17.3,1.5);
    vec1 = vec2;
    EXPECT_FLOAT_EQ(vec1->getX(), 91.0);
    EXPECT_FLOAT_EQ(vec1->getY(), 17.3);
    EXPECT_FLOAT_EQ(vec1->getZ(), 1.5);
}

TEST_F(Vector3D_Test, Magnitude) {
    Vector3D *vec1 = new Vector3D(3.1,9.4,1.8);
    Vector3D *vec2 = new Vector3D(91.0,17.3,1.5);
    EXPECT_FLOAT_EQ(vec1->getMagnitude(),10.060318);
    EXPECT_FLOAT_EQ(vec2->getMagnitude(),92.641998);
}

TEST_F(Vector3D_Test, Normalize) {
        Vector3D *vec1 = new Vector3D(3.1,9.4,1.8);
        Vector3D *vec2 = new Vector3D(91.0,17.3,1.5);
        EXPECT_FLOAT_EQ(vec1->getX(), 3.1);
        EXPECT_FLOAT_EQ(vec1->getY(),9.4);
        EXPECT_FLOAT_EQ(vec1->getZ(),1.8);
        EXPECT_FLOAT_EQ(vec2->getX(), 91);
        EXPECT_FLOAT_EQ(vec2->getY(), 17.3);
        EXPECT_FLOAT_EQ(vec2->getZ(), 1.5);
    }

    TEST_F(Vector3D_Test, DotProduct) {
        Vector3D* v1 = new Vector3D(3.1,9.4,1.8);
        Vector3D* v2 = new Vector3D(91.0,17.3,1.5);

        Vector3D vec1 = *v1;
        Vector3D vec2 = *v2;

        EXPECT_FLOAT_EQ(vec1.getDotProduct(vec1),101.20999);
        EXPECT_FLOAT_EQ(vec1.getDotProduct(vec2),447.41998);
    }

    // TEST_F(Vector3D_Test, CrossProduct) {
    //     Vector3D* v1 = new Vector3D(3.1,9.4,1.8);
    //     Vector3D* v2 = new Vector3D(91.0,17.3,1.5);

    //     Vector3D vec1 = *v1;
    //     Vector3D vec2 = *v2;

    //     std::vector<float> exp1 = vec1.getCrossProduct(vec2);
    //     std::vector<float> exp2 = vec1.getCrossProduct(vec1);

    //     EXPECT_FLOAT_EQ(exp1[0],0);
    //     EXPECT_FLOAT_EQ(exp1[1],0);
    //     EXPECT_FLOAT_EQ(exp1[2],0);

    //     EXPECT_FLOAT_EQ(exp2[0],-32);
    //     EXPECT_FLOAT_EQ(exp2[1],24);
    //     EXPECT_FLOAT_EQ(exp2[2],-8);
    // }

    TEST_F(Vector3D_Test, StandardArithmetic) {
        Vector3D* v1 = new Vector3D(3.1,9.4,1.8);
        Vector3D* v2 = new Vector3D(91.0,17.3,1.5);

        Vector3D vec1 = *v1;
        Vector3D vec2 = *v2;

        Vector3D sum = vec1 + vec2;
        Vector3D prod = vec1 * 4;
        Vector3D diff = vec1 - vec2;

        EXPECT_FLOAT_EQ(sum.getX(), 94.1);
        EXPECT_FLOAT_EQ(sum.getY(), 26.7);
        EXPECT_FLOAT_EQ(sum.getZ(), 3.3);

        EXPECT_FLOAT_EQ(prod.getX(), 12.4);
        EXPECT_FLOAT_EQ(prod.getY(), 37.6);
        EXPECT_FLOAT_EQ(prod.getZ(), 7.2);

        EXPECT_FLOAT_EQ(diff.getX(), -87.9);
        EXPECT_FLOAT_EQ(diff.getY(), -7.9);
        EXPECT_FLOAT_EQ(diff.getZ(), 0.3);

    }

    TEST_F(Vector3D_Test, ToFloatVec) {
        Vector3D vec1 = *standard;
        Vector3D *man = new Vector3D(3.1,9.4,1.8);
        Vector3D manual = *man;

        std::vector<float> floatVec1 = vec1.toFloatVec(vec1);
        std::vector<float> floatManual = manual.toFloatVec(manual);

        std::vector<float> exp1 = {0,0,0};
        std::vector<float> exp2 = {3.1, 9.4, 1.8};

        EXPECT_EQ(floatVec1, exp1);
        EXPECT_EQ(floatManual, exp2);

    }

}