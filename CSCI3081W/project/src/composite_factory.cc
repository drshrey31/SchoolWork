#include "composite_factory.h"
#include "json_helper.h"

namespace csci3081 {
    void CompositeFactory::AddFactory(IEntityFactory* factory){
        this->factories.push_back(factory);
    }
    IEntity* CompositeFactory::CreateEntity(const picojson::object& val){
        for (IEntityFactory* factory: factories){
            IEntity* entity = factory->CreateEntity(val);
            if (entity != NULL){
                return entity;
            }
        }
        return NULL;
    }
    std::vector<IEntityFactory*> CompositeFactory::GetEntities(){
        return this->factories;
    }
    
}