/**
 *@file composite_factory.h
 */

#ifndef COMPOSITE_FACTORY_H_
#define COMPOSITE_FACTORY_H_

/*******************************************************************************
 * Includes
 ******************************************************************************/

#include <EntityProject/facade/delivery_system.h>
#include "drone_factory.h"
#include "customer_factory.h"
#include "package_factory.h"
namespace csci3081 {

/*******************************************************************************
 * Class Definitions
 ******************************************************************************/
/**
 * @brief This is the Composite Factory
 *
 * This class will serve as the Do-It-All Factory that contains all factories and generates all entities present within the drone simulation.
 * 
 */

    class CompositeFactory : public IEntityFactory {
        public: 
            /**
            * @brief Overloaded Battery Constructor
            * orders sections 
            * 
            * @param[in] factory
            * 
            * @return: Nothing 
            * 
            */
            void AddFactory (IEntityFactory* factory);

            /**
            * @brief Method that creates an entity from a picojson object.
            * 
            * @param[in] val
            * 
            * @return: Entity that has been created (for Iteration 1, this would be a drone, customer, or package object)
            * 
            */
            IEntity* CreateEntity (const picojson::object& val);

            /**
            * @brief Method that gets entities we created. 
            * 
            * 
            * @return: A vector of all the Entity Factories we have so far.
            * 
            */
            std::vector<IEntityFactory*> GetEntities ();
                                               
        private:
            std::vector<IEntityFactory*> factories;
    };
}

#endif