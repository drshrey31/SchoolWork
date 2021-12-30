/**
 *@file package_factory.h
 */

#ifndef PACKAGE_FACTORY_H_
#define PACKAGE_FACTORY_H_

/*******************************************************************************
 * Includes
 ******************************************************************************/

#include <EntityProject/facade/delivery_system.h>
#include "package.h"

namespace csci3081 {

/*******************************************************************************
 * Class Definitions
 ******************************************************************************/
/**
 * @brief This is the Package Factory
 *
 * This class will be be a factory for creating new Package objects.
 * 
 */

    class PackageFactory : public IEntityFactory {
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
        
    };
}

#endif