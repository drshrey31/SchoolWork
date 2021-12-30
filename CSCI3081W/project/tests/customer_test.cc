#include "gtest/gtest.h"
#include <EntityProject/project_settings.h>
#include "../include/delivery_simulation.h"
#include <EntityProject/entity.h>
#include "json_helper.h"
#include "package.h"
#include <iostream>

namespace csci3081 {


class Customer_Test : public ::testing::Test {
protected:
  virtual void SetUp() {

    posVector = {498.292, 253.883, -228.623};
    posVector2 = {6985.4, -85397.7, 9395.3};
    vecCustomer = {475, 9064, -979};  
    vecCustomer2 = {8837.23,-424.45,9585.24};

    picojson::object pico = JsonHelper::CreateJsonObject();
    JsonHelper::AddStringToJsonObject(pico, "name", "Alex");
    JsonHelper::AddStringToJsonObject(pico, "type", "customer");
    JsonHelper::AddStdFloatVectorToJsonObject(pico, "position", posVector);
    JsonHelper::AddStdFloatVectorToJsonObject(pico, "direction", vecCustomer);
    
    picojson::object newPico = JsonHelper::CreateJsonObject();
    JsonHelper::AddStringToJsonObject(newPico, "name", "John");
    JsonHelper::AddStringToJsonObject(newPico, "type", "customer");
    JsonHelper::AddStdFloatVectorToJsonObject(newPico, "position", posVector2);
    JsonHelper::AddStdFloatVectorToJsonObject(newPico, "direction", vecCustomer2);
    

    customer1 = new Customer();
    customer2 = new Customer(pico);
    customer3 = new Customer(newPico);
  }

  virtual void TearDown() {
    // delete customer1;
    // delete customer2;
    // delete customer3;
  }

  std::vector<float> posVector;
  std::vector<float> vecCustomer;
  std::vector<float> posVector2;
  std::vector<float> vecCustomer2;

  Customer *customer1;
  Customer *customer2;
  Customer *customer3;
};


//* Default Declaration Test
TEST_F(Customer_Test, Constructor){
    std::vector<float> zeroVec = {0.0,0.0,0.0};
    
    EXPECT_EQ(customer1->GetName(), "N/A")<< "Cons: Name"<< std::endl;
    EXPECT_EQ(customer1->GetId(), -1)<< "Cons: ID"<< std::endl;
    EXPECT_EQ(customer1->GetPosition(), zeroVec)<< "Cons: Position"<< std::endl;
    EXPECT_EQ(customer1->GetDirection(), zeroVec)<< "Cons: Direction"<< std::endl;
    EXPECT_FALSE(customer1->IsDynamic())<< "Cons: isDynamic"<< std::endl;
}

//* PicoJson Constructor Test
TEST_F(Customer_Test, PicoConstructor){

    EXPECT_EQ(customer2->GetName(), "Alex");
    EXPECT_EQ(customer2->GetId(), 2);
    EXPECT_EQ(customer2->GetPosition(), posVector);
    EXPECT_EQ(customer2->GetDirection(), vecCustomer);
    EXPECT_FALSE(customer2->IsDynamic());
}

//* Copy Constructor Test
TEST_F(Customer_Test, Assignment){

    customer2 = customer3;
    EXPECT_EQ(customer2->GetName(), "John");
    EXPECT_EQ(customer2->GetId(), 2);
    EXPECT_EQ(customer2->GetPosition(), posVector2);
    EXPECT_EQ(customer2->GetDirection(), vecCustomer2); 
    EXPECT_FALSE(customer2->IsDynamic());
}

}
