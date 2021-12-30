#include "gtest/gtest.h"
#include <EntityProject/project_settings.h>
#include "../include/delivery_simulation.h"
#include <EntityProject/entity.h>
#include "json_helper.h"
#include "package.h"
#include <iostream>

namespace csci3081 {


class Package_Test : public ::testing::Test {
protected:
  virtual void SetUp() {
    origPkg = new Package();
  }
  virtual void TearDown() {
    
  }
  Package *origPkg;
};

/*******************************************************************************
 * Package_Test
 ******************************************************************************/

TEST_F(Package_Test, ConstructorDefault){
    EXPECT_FLOAT_EQ(origPkg->GetId(), 0);
    EXPECT_EQ(origPkg->GetCustomer()->GetName(), "N/A");
    EXPECT_FLOAT_EQ(origPkg->GetWeight(), 0);

}

TEST_F(Package_Test, ConstructorJson_Getters){
    std::vector<float> defPos = {150.0, 340.50, 1145.45};
    std::vector<float> customerPos = {475, 9064, -979};

    //build pico, the picojson object
    picojson::object pico = JsonHelper::CreateJsonObject();
    JsonHelper::AddStringToJsonObject(pico, "type", "customer");
    JsonHelper::AddStringToJsonObject(pico, "name", "Amazon");
    JsonHelper::AddFloatToJsonObject(pico, "id", 1.0);
    JsonHelper::AddFloatToJsonObject(pico, "radius", 1.0);
    JsonHelper::AddStdFloatVectorToJsonObject(pico, "position", defPos);
    JsonHelper::AddStdFloatVectorToJsonObject(pico, "direction", customerPos);
    Customer *customer = new Customer(pico);
    Vector3D *posVector = new Vector3D(150.0, 340.50, 1145.45);
    Package *testPkg= new Package(customer, 3.4, posVector);

    EXPECT_FLOAT_EQ(testPkg->GetId(), 0);
    EXPECT_EQ(testPkg->GetCustomer()->GetName(), "Amazon");
    EXPECT_EQ(testPkg->GetCustomer()->GetRadius(), 0);
    EXPECT_FLOAT_EQ(testPkg->GetWeight(), 3.4);
}


TEST_F(Package_Test, CopyMethod){
    std::vector<float> defPos = {150.0, 340.50, 1145.45};
    std::vector<float> customerPos = {475, 9064, -979};
    
    picojson::object pico = JsonHelper::CreateJsonObject();
    JsonHelper::AddStringToJsonObject(pico, "type", "customer");
    JsonHelper::AddStringToJsonObject(pico, "name", "EBay");
    JsonHelper::AddFloatToJsonObject(pico, "id", 1.0);
    JsonHelper::AddFloatToJsonObject(pico, "radius", 1.0);
    JsonHelper::AddStdFloatVectorToJsonObject(pico, "position", defPos);
    
    JsonHelper::AddStdFloatVectorToJsonObject(pico, "direction", customerPos);
    
    Customer *customer = new Customer(pico);
    
    Vector3D *posVector = new Vector3D(150.0, 340.50, 1145.45);
    
    origPkg = new Package(customer, 3.4, posVector);
    EXPECT_FLOAT_EQ(origPkg->GetId(), 0);
    EXPECT_EQ(origPkg->GetCustomer()->GetName(), "EBay");
    EXPECT_EQ(origPkg->GetCustomer()->GetRadius(), 0);
    EXPECT_FLOAT_EQ(origPkg->GetWeight(), 3.4);
}

}