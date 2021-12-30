#include "customer.h"

namespace csci3081 {
    Customer::Customer(){
        this->id = -1;
        this->name = "N/A";
        this->position = new Vector3D(0.0, 0.0, 0.0);
        this->direction = new Vector3D(0.0, 0.0, 0.0);
        this->dynamic = false;
    }

    Customer::~Customer(){
        delete this->position;
        delete this->direction;
    }

    Customer::Customer(const picojson::object& details){
        //parse picojson object
        vector<float> posVector = JsonHelper::GetStdFloatVector(details, "position");
        vector<float> dirVector = JsonHelper::GetStdFloatVector(details, "direction");

        this->name = JsonHelper::GetString(details, "name");
        this->id = 2;
        this->details = details;
        this->position = new Vector3D(posVector);
        this->direction = new Vector3D(dirVector);
        this->dynamic = false;
    }

    //copy constructor
    Customer::Customer (const Customer &customer2){
        this->id = customer2.id;
        this->name = customer2.name;
        this->direction = customer2.direction;
        this->details = customer2.details;
        this->position = customer2.position;
        this->dynamic = false;
    }

}