/**
 *@file drone_factory.h
 */

#ifndef DRONE_FACTORY_H_
#define DRONE_FACTORY_H_

/*******************************************************************************
 * Includes
 ******************************************************************************/

#include <EntityProject/facade/delivery_system.h>
#include "drone.h"
#include "json_helper.h"
namespace csci3081 {

/*******************************************************************************
 * Class Definitions
 ******************************************************************************/
/**
 * @brief This is the Drone Factory
 *
 * This class will be be a factory for creating new Drone objects.
 * 
 */

    class DroneFactory : public IEntityFactory {
        public: 
            /**
            * @brief Method that creates an entity from a picojson object.
            * 
            * @param[in] val
            * 
            * @return: Entity that has been created (a drone in this case)
            * 
            */        
            IEntity* CreateEntity(const picojson::object& val);  
                                                                              
        private:
        
    };
}

#endif