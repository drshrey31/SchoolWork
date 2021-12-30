#include "gtest/gtest.h"
#include <EntityProject/project_settings.h>
#include "../include/delivery_simulation.h"
#include <EntityProject/entity.h>
#include "json_helper.h"
#include "drone.h"

#include <iostream>

namespace csci3081 {


class Drone_Test : public ::testing::Test {
protected:
  virtual void SetUp() {
    std::vector<float> posVector = {1150.0, 500.5, 3250.05};
    std::vector<float> dirVector = {3, 13, 23};
    float distance = 8.2;

    picojson::object pico = JsonHelper::CreateJsonObject();
    JsonHelper::AddStringToJsonObject(pico, "type", "drone");
    JsonHelper::AddStringToJsonObject(pico, "name", "Drone");
    JsonHelper::AddFloatToJsonObject(pico, "speed", 15.0);
    JsonHelper::AddFloatToJsonObject(pico, "distance", distance);
    JsonHelper::AddStdFloatVectorToJsonObject(pico, "position", posVector);
    JsonHelper::AddStdFloatVectorToJsonObject(pico, "direction", dirVector);


    drone = new Drone(pico);
  }
  
  virtual void TearDown() {
    // delete drone;
  }

          // Battery* powerSource;
          // float distance;
          // vector<Package*> packages;
          // vector<Customer*> customers; 
          // Package* currPackage; 

  Drone *drone;
};

/*******************************************************************************
 * Drone Test Cases
 ******************************************************************************/

//* Test: PicoJsonConstructor and Accessor Methods
TEST_F(Drone_Test, PicoConstructor) {
  std::vector<float> posVector = {1150.0, 500.5, 3250.05};
  std::vector<float> dirVector = {1,2,3};
  
  picojson::object pico = JsonHelper::CreateJsonObject();
  JsonHelper::AddStringToJsonObject(pico, "type", "drone");
  float distance = 1.4;
  JsonHelper::AddStringToJsonObject(pico, "name", "Drone");
  JsonHelper::AddFloatToJsonObject(pico, "distance", distance);
  JsonHelper::AddFloatToJsonObject(pico, "speed", 15.0);
  
  JsonHelper::AddStdFloatVectorToJsonObject(pico, "position", posVector);
  JsonHelper::AddStdFloatVectorToJsonObject(pico, "direction", dirVector);

  Drone *drone = new Drone(pico);
  EXPECT_NE(drone, nullptr);
  EXPECT_EQ(drone->GetName(), "Drone");
  EXPECT_FLOAT_EQ(drone->GetPosition()[0], posVector[0]);
  EXPECT_FLOAT_EQ(drone->GetPosition()[1], posVector[1]);
  EXPECT_FLOAT_EQ(drone->GetPosition()[2], posVector[2]);
  EXPECT_FLOAT_EQ(drone->GetDirection()[0], dirVector[0]);
  EXPECT_FLOAT_EQ(drone->GetDirection()[1], dirVector[1]);
  EXPECT_FLOAT_EQ(drone->GetDirection()[2], dirVector[2]);
  //delete drone;
}

}  // namespace csci3081
