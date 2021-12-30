#include "gtest/gtest.h"
#include <EntityProject/project_settings.h>
#include "../include/delivery_simulation.h"
#include <EntityProject/entity.h>
#include "json_helper.h"
#include "package.h"
#include <iostream>

namespace csci3081 {

class BatteryTest : public ::testing::Test {
protected:
  virtual void SetUp() {
  }
  virtual void TearDown() {
  }
  Battery batman = Battery();
  Battery batwoman = Battery(200,100,true);
};

TEST_F(BatteryTest, Constructor){
    EXPECT_EQ(batman.isDead(), false);
    EXPECT_EQ(batman.getBatteryLevel(), 50);
    EXPECT_EQ(batman.getMaxCharge(), 100);
}

TEST_F(BatteryTest, OverloadedConstructor){
    EXPECT_EQ(batwoman.isDead(), false);
    EXPECT_EQ(batwoman.getBatteryLevel(), 100);
    EXPECT_EQ(batwoman.getMaxCharge(), 200);
}

}
