/**
 *@file package.h
 */

#ifndef PACKAGE_H_
#define PACKAGE_H_

/*******************************************************************************
 * Includes
 ******************************************************************************/

#include "entity_base.h"
#include "customer.h"
#include <vector>
#include <string>

namespace csci3081 {

/*******************************************************************************
 * Class Definitions
 ******************************************************************************/
/**
 * @brief The class for creating Packages.
 *
 * This class is used to define the parameters and attributes of a Customer in the drone package delivery simulation.
 *
 */
    class Package : public csci3081::EntityBase {
        public: 
            Package();
            Package(Customer *newCustomer, float newWeight, Vector3D *newDest);
            /**
            * @brief Picojson constructor for a Package object
            * 
            * @param[in] details: details is the picojson object from which we will extract the attributed
            * of the Package object being constructed
            * 
            */  
            Package(const picojson::object& pico);
            
            ~Package();
           /**
             * @brief Package copy constructor:  
             * 
             * @param[in] package2: package2 is a pointer to a package that will be picked up by the drone
             * 
             * @return: package object 
            */
            Package (const Package &package2);
            
            /**
             * @brief GetCustomer:   
             * 
             * @param[in] None
             * 
             * @return: package object 
            */
            Customer* GetCustomer();
            
            /**
             * @brief SetCustomer:   
             * 
             * @param[in] customer: A pointer to the customer object we are setting to
             * 
             * @return: None 
            */
            void SetCustomer(Customer* customer);

            /**
             * @brief GetWeight:  
             * 
             * @param[in] package2: package2 is a pointer to a package that will be picked up by the drone
             * 
             * @return: package object 
            */
            float GetWeight();

            /**
             * @brief getDestination:  
             * 
             * @param[in] None
             * 
             * @return: package object 
            */
            Vector3D* getDestination();

           /**
             * @brief setDynamic:  
             * 
             * @param[in] val: The boolean value for whether the package can move (true) or not (false)
             *  
            */
            void SetDynamic(bool val);
        private:
            Customer *customer;
            float weight;
            int id;
            Vector3D *destination;
    };
}
#endif