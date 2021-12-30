#include "drone_factory.h"

namespace csci3081{
    IEntity* DroneFactory::CreateEntity(const picojson::object& val){
        if (JsonHelper::GetString(val, "type") == "drone") {
            return new Drone(val);
        }
        return NULL;
    }
}