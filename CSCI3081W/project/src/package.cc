#include "package.h"

namespace csci3081 {
    Package::Package(){
        customer = new Customer();
        weight = 0;
        id = 0;
    }

    Package::Package(Customer *newCustomer, float newWeight, Vector3D *newDest){
        this->customer = newCustomer;
        this->weight = newWeight;
    }

    Package::Package(const picojson::object& pico){
        std::vector<float> temp = JsonHelper::GetStdFloatVector(pico, "position");
        std::vector<float> tempDir = JsonHelper::GetStdFloatVector(pico, "direction");
        this->id = (rand() % 1000000 + 100000) + 1; 
        this->name = JsonHelper::GetString(pico, "name");
        this->type = JsonHelper::GetString(pico, "type");
        this->position = new Vector3D(temp);
        this->direction = new Vector3D(tempDir);
        this->weight = 1.5;
        this->radius = static_cast<float>(JsonHelper::GetDouble(pico, "radius"));
        this->details= pico;
    }

    Package::~Package(){
        delete customer;
    }
    
    Package::Package (const Package &package2){
        this->customer = package2.customer;
        this->weight = package2.weight;
    }

    Customer* Package::GetCustomer(){
        return customer;
    }

    void Package::SetCustomer(Customer* customer){
        this->customer = customer;
    }

    float Package::GetWeight(){
        return this->weight;
    }

    void Package::SetDynamic(bool val){
        this->dynamic = val;
    }
}
