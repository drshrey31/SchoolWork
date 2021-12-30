#ifndef DRONE_H_
#define DRONE_H_

#include "battery.h"
/**
 *@file drone.h
 */

#include "entity_base.h"
#include <vector>
#include <string>
#include "package.h"
 
namespace csci3081 {
/*******************************************************************************
 * Class Definitions
 ******************************************************************************/
/**
 * @brief The class for creating Drones.
 *
 * This class is used to create new Drones and perform operations on Drones.
 *
 * See the documentation for IEntity for more information
 */
   class Drone : public csci3081::EntityBase {
       public:
                /**
                 * @brief Picojson constructor for a Drone object
                 * 
                 * @param[in] details: details is the picojson object from which we will extract the attributed
                 * of the Drone object being constructed
                 * 
                */    
            Drone(const picojson::object& details);
            ~Drone();
                /**
                 * @brief pickUpOrder: the method to take a package and put it within the
                 * orders sections 
                 * 
                 * @param[in] p: p is a pointer to a package that will be picked up by the drone
                 * 
                 * @return: the return value 
                 * 
                */
            int pickUpOrder(Package* p);
                /**
                 * @brief dropOffOrder: the method to remove a given package from the orders sections
                 * 
                 * @param[in] p: p is a pointer to a package that will be removed by the drone
                 * 
                 * 
                 * @return: the return value 
                 * 
                */
            //int dropOffOrder(Package* p);
                
                /**
                 * @brief SetGraphDirection: 
                 * 
                 * @param[in] graph_directions: the given graph directions to be set as the directions for the drone
                 * 
                 * 
                 * @return: no return value
                 * 
                */
            void SetGraphDirections(std::vector<std::vector<float>> &graph_directions);

                /**
                 * @brief updatePosition: updates the current position of the drone based on the time elapsed
                 * 
                 * @param[in] dt: the time that has passed in seconds
                 * 
                 * @return: no return value
                 * 
                */
            void updatePosition(float dt);

            void arrayDirectionsToPackage(std::vector<std::vector<float>> &dirs);

            void arrayDirectionsToCustomer(std::vector<std::vector<float>> &dirs);

            void updateDronePackage(float dt);

            void updateCustomerPackage(float dt);

       private:
           Battery* powerSource;
           float distance;
           vector<Package*> packages; //current_packages
           vector<Customer*> customers; //pack_to_customer
           Package* currPackage; //package_currently_delivering
           std::vector<std::vector<float>> graphDirections;
           float speed;
           std::vector<std::vector<float>> dirToPackage;
           std::vector<std::vector<float>> dirToCustomer;
       };
}
#endif