#include "entity_base.h"

namespace csci3081 {

      EntityBase::EntityBase(){

      }
      EntityBase::EntityBase(const picojson::object& details) {
         vector<float> posVec = JsonHelper::GetStdFloatVector(details, "position");
         vector<float> dirVec = JsonHelper::GetStdFloatVector(details, "direction");
         
         this->position = new Vector3D(posVec);
         this->direction = new Vector3D(dirVec);
         this->name = JsonHelper::GetString(details, "name");
         this->type = JsonHelper::GetString(details, "type");
         this->radius = JsonHelper::GetDouble(details, "radius");
      }
      
      EntityBase::~EntityBase() {
         delete position;
         delete direction;
      }

      const picojson::object& EntityBase::GetDetails() { 
         return this->details; 
      }
      
      const std::string& EntityBase::GetName(){
         return name;
      }

      const std::string& EntityBase::GetType(){
         return type;
      }

      int EntityBase::GetId() const{
         return id;
      }

      void EntityBase::SetId(int id)
      {
         this->id = id;
      }

      const std::vector<float> &EntityBase::GetPosition() const {
         return position->toFloatVec(*position);
      }

      void EntityBase::SetPosition(Vector3D *posVector){
         this->position = posVector; 
      } 
      
      const std::vector<float> &EntityBase::GetDirection() const {
         return direction->toFloatVec(*direction);
      }
      
      void EntityBase::SetDirection(const std::vector<float> &toChangeTo){
         this->direction->setX(toChangeTo[0]);
         this->direction->setY(toChangeTo[1]);
         this->direction->setZ(toChangeTo[2]);
      }

      float EntityBase::GetRadius() const {
         return radius;
      }
      int EntityBase::GetVersion() const {return version;}
      void EntityBase::SetVersion(int newVersion){this->version = newVersion;}
      bool EntityBase::IsDynamic() const {return this->dynamic;}
}