/**
 *@file customer_factory.h
 */

#ifndef CUSTOMER_FACTORY_H_
#define CUSTOMER_FACTORY_H_

/*******************************************************************************
 * Includes
 ******************************************************************************/

#include <EntityProject/facade/delivery_system.h>
#include "customer.h"
namespace csci3081 {

/*******************************************************************************
 * Class Definitions
 ******************************************************************************/
/**
 * @brief This is the Customer Factory
 *
 * This class will be be a factory for creating new Customer objects.
 * 
 * 
 */

// DO NOT MODIFY (unless you really know what you are doing)
    class CustomerFactory : public IEntityFactory {
        public: 
            /**
            * @brief Method that creates an entity from a picojson object.
            * 
            * @param[in] val
            * 
            * @return: Entity that has been created (for Iteration 1, this would be a drone, customer, or package object)
            * 
            */
            IEntity* CreateEntity(const picojson::object& val);                                                            
        private:
            std::vector<Customer*> customerFactories;
    };
}

#endif