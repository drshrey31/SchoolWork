///\file
#include "drone.h"

namespace csci3081 {

Drone::Drone(const picojson::object& details) {
  // TODO for lab10: store the position and direction vectors.
		vector<float> posVector = JsonHelper::GetStdFloatVector(details, "position");
    vector<float> dirVector = JsonHelper::GetStdFloatVector(details, "direction");
    
    this->position = new Vector3D(posVector);
		this->direction = new Vector3D(dirVector);
		this->type = JsonHelper::GetString(details, "type");
	  this->name = JsonHelper::GetString(details, "name");;
    this->speed = JsonHelper::GetDouble(details, "speed");
    this->currPackage = NULL;
    this->powerSource = new Battery();
    this->details = details;
    this->dynamic = true;
}

Drone::~Drone(){
  delete position;
  delete direction;
  delete powerSource;
}

int Drone::pickUpOrder(Package* p){
  std::cout<< "Picking up order" << std::endl;
  this->packages.push_back(p);
  std::cout<< "Picked up order" << std::endl;
}

// int Drone::dropOffOrder(Package* p){
//   this->packages.erase(std::find(this->packages.begin(), this->packages.end(),p));
// }


void Drone::SetGraphDirections(std::vector<std::vector<float>> & graph_directions){
  this->graphDirections = graph_directions;
}

//helper method that adds the vector of graph directions to the drone directions to get to the package
void Drone::arrayDirectionsToPackage(std::vector<std::vector<float>> &dirs){
  this->dirToPackage = dirs;
}

//helper method that adds the vector of graph directions to the drone directions to get to the customer
void Drone::arrayDirectionsToCustomer(std::vector<std::vector<float>> &dirs){
  this->dirToCustomer = dirs;
}


// This method is used during Delivery Simulation to update the position of the drone given time in seconds.
void Drone::updatePosition(float dt){
    if (dirToPackage.size()>0){
        this->updateDronePackage(dt);
    }

    else if (dirToPackage.size()==0 && dirToCustomer.size()>0){
      this->updateCustomerPackage(dt);
    }
}

// This method is used during Delivery Simulation to update the packages held by drone in real time.
// The 
void Drone::updateDronePackage(float dt){
      //this is a vector holding the position of the package
      std::vector<float> packageDir = dirToPackage[0];

      std::cout << "packageDir[x]: " << packageDir[0] << std::endl;
      std::cout << "packageDir[y]: " << packageDir[1] << std::endl;
      std::cout << "packageDir[z]: " << packageDir[2] << std::endl;
      //this is a vector holding the drone's current position
      Vector3D *packageDir3D = new Vector3D(packageDir);
      
      //if the position of the drone is the same as the position of the package,
      //then we are done

      std::cout << "drone[x]: " << this->position->getX() << std::endl;
      std::cout << "drone[y]: " << this->position->getY() << std::endl;
      std::cout << "drone[z]: " << this->position->getZ() << std::endl;

      if (this->position->isEqual(packageDir3D)){
        std::cout << "Drone is same spot as package" << std::endl;
        dirToPackage.erase(dirToPackage.begin());
      }

      else{
        // distance = package position - drone position
        Vector3D *disp = this->position->findDistance(*this->position, packageDir);

        float newX = this->position->getX() + disp->getX() * this->speed *dt;
        float newY = this->position->getY() + disp->getY() * this->speed *dt;
        float newZ = this->position->getZ() + disp->getZ() * this->speed *dt;

        this->position = new Vector3D(newX, newY, newZ);

        for (int i = 0; i < packages.size(); i++){
          packages[i]->SetDynamic(true);
          packages[i]->SetPosition(this->position);
        }
      }
      std::cout << "After updateDronePackage" << std::endl;
  }

  // This method is used during Delivery Simulation 
  void Drone::updateCustomerPackage(float dt){
      std::vector<float> customerDir = dirToCustomer[0];
      Vector3D *customerDir3D = new Vector3D(customerDir);

      if (this->position->isEqual(customerDir3D) && customerDir3D->isEqual(this->position)){
        dirToCustomer.erase(dirToCustomer.begin());
      }

      else {
        
        Vector3D *disp = this->position->findDistance(*this->position, customerDir);

        float newX = this->position->getX() + disp->getX() * this->speed *dt;
        float newY = this->position->getY() + disp->getY() * this->speed *dt;
        float newZ = this->position->getZ() + disp->getZ() * this->speed *dt;


        this->position = new Vector3D(newX, newY, newZ);
        
        for (int i =0; i < packages.size(); i++){
          packages[i]->SetDynamic(true);
          packages[i]->SetPosition(this->position);
        }
      }
  }


}