#include "delivery_simulation.h"
#include "entity_base.h"
#include "json_helper.h"
#include "drone.h"

namespace csci3081 {

DeliverySimulation::DeliverySimulation() {

	cFactory = new CompositeFactory();
	cFactory->AddFactory(new DroneFactory());
	cFactory->AddFactory(new CustomerFactory());
	cFactory->AddFactory(new PackageFactory());
}

DeliverySimulation::~DeliverySimulation() {
	delete cFactory;

}

IEntity* DeliverySimulation::CreateEntity(const picojson::object& val) {
  //TODO for lab10: replace the ?????'s with the appropriate values,
  //  then uncomment the section of code

	IEntity* entity = this->cFactory->CreateEntity(val);
	if(entity == NULL){
		return NULL;
	}	
  	else{
		return entity;
	}
}

void DeliverySimulation::AddFactory(IEntityFactory* factory) {
	cFactory->AddFactory(factory);
}

void DeliverySimulation::AddEntity(IEntity* entity) { 
  //TODO for lab10: One line of code
	entities_.push_back(entity);
}

void DeliverySimulation::SetGraph(const IGraph* graph) {
	this->myGraph = graph;
}

void DeliverySimulation::ScheduleDelivery(IEntity* package, IEntity* dest) {
	Package* PackageA = dynamic_cast<Package*>(package);
	Customer* CustomerA = dynamic_cast<Customer*>(dest);

	if (PackageA){
		this->AddEntity(PackageA);
	}
	if (CustomerA){
		this->AddEntity(CustomerA);
	}
	int i;
	for (i = 0; i < entities_.size(); i++){
		//since we aren't given a drone, we have to cast to a drone from the entities
		try{
			Drone* drone = dynamic_cast<Drone*>(entities_[i]);
			if (drone != NULL){
				if (drone->GetType() == "drone"){
					if (CustomerA != NULL){
						if (CustomerA->GetType() == "customer"){
							PackageA->SetCustomer(CustomerA);
						}
					}

					if (PackageA != NULL){
						if (PackageA->GetType() == "package"){
							drone->pickUpOrder(PackageA);
							vector<float> packagePosition = PackageA->GetPosition();
							vector<float> initDronePosition = drone->GetPosition();

							graphDir = myGraph->GetPath(initDronePosition, packagePosition);
							
 
							drone->arrayDirectionsToPackage(graphDir);

							vector<float> customerPosition = CustomerA->GetPosition();
							vector<float> newDronePosition = drone->GetPosition();

							graphDir = myGraph->GetPath(newDronePosition, customerPosition);
							
							drone->arrayDirectionsToCustomer(graphDir);
						}
					}
				}
			}
		}
		// Implemented a try-catch block to catch erroneous dynamic_cast to drone
		catch (...){
			std::cout << "Error: Drone dynamic cast not working" << std::endl; // general catch
		}
	}
}

void DeliverySimulation::AddObserver(IEntityObserver* observer) {}

void DeliverySimulation::RemoveObserver(IEntityObserver* observer) {}

const std::vector<IEntity*>& DeliverySimulation::GetEntities() const { 
	return entities_; 
}

void DeliverySimulation::Update(float dt) {
	// we loop through the entities and cast the corresponding entities as a drone, package, or customer object
	for (int i = 0; i < entities_.size(); i++){
		try{
			Drone *drone = dynamic_cast<Drone*>(entities_[i]);
			Package *package = dynamic_cast<Package*>(entities_[i]);
			Customer *customer = dynamic_cast<Customer*>(entities_[i]);
			//once we have gotten a correct cast for the drone object, we move on to the delivery simulation
			if(drone != NULL){
				if (drone->GetType() == "drone"){
					// the update position helper method for the drone is used to update the position
					// of the drone in real-time
					drone->updatePosition(dt);
					if(customer != NULL){
						if (customer->GetType() == "customer"){
							std::vector<float> droneCurrPos = drone->GetPosition();
							std::vector<float> customerCurrPos = customer->GetPosition();
							// the delivery simulation ends when the drone reaches the customer 
							if (droneCurrPos == customerCurrPos){	
								break;
							}
						}
					}
				}
			}	
		}
		// Implemented a try-catch block to catch erroneous dynamic_casts 
		catch(...){
			std::cout << "Dynamic casting error" << std::endl;
		}
	}
}


// DO NOT MODIFY THE FOLLOWING UNLESS YOU REALLY KNOW WHAT YOU ARE DOING
void DeliverySimulation::RunScript(const picojson::array& script, IEntitySystem* system) const {
  JsonHelper::PrintArray(script);
  IDeliverySystem* deliverySystem = dynamic_cast<IDeliverySystem*>(system);
	if (deliverySystem) {

	    // To store the unadded entities_
	    std::vector<IEntity*> created_entities;

		for (unsigned int i=0; i < script.size(); i++) {
			const picojson::object& object = script[i].get<picojson::object>();
			const std::string cmd = object.find("command")->second.get<std::string>();
			const picojson::object& params = object.find("params")->second.get<picojson::object>();
			// May want to replace the next few if-statements with an enum
			if (cmd == "createEntity") {
				IEntity* entity = NULL;
				entity = deliverySystem->CreateEntity(params);
				if (entity) {
					created_entities.push_back(entity);
				} else {
					std::cout << "Null entity" << std::endl;
				}
			}
			else if (cmd == "addEntity") {
				int ent_index = static_cast<int>(params.find("index")->second.get<double>());
				if (ent_index >= 0 && ent_index < created_entities.size()) {
					deliverySystem->AddEntity(created_entities[ent_index]);
				}
			}
			else if (cmd == "scheduleDelivery" ) {
				int pkg_index = static_cast<int>(params.find("pkg_index")->second.get<double>());
				int dest_index = static_cast<int>(params.find("dest_index")->second.get<double>());
				if (pkg_index >= 0 && pkg_index < system->GetEntities().size()) {
					IEntity* pkg = deliverySystem->GetEntities()[pkg_index];
					if (dest_index >= 0 && pkg_index < system->GetEntities().size()) {
						IEntity* cst = system->GetEntities()[dest_index];
						if (pkg && cst) {
							deliverySystem->ScheduleDelivery(pkg, cst);
						}
					}
				}
				else {
					std::cout << "Failed to schedule delivery: invalid indexes" << std::endl;
				}
			}
		}
	}
}

}
