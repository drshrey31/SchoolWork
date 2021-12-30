#include "package_factory.h"

namespace csci3081{
    IEntity* PackageFactory::CreateEntity(const picojson::object& val){
        if (JsonHelper::GetString(val, "type") == "package") {
            return new Package(val);
        }
        return NULL;
    }
}