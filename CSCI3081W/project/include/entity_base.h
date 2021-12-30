/**
 *@file entity_base.h
 */
#ifndef ENTITY_BASE_H_
#define ENTITY_BASE_H_

/*******************************************************************************
 * Includes
 ******************************************************************************/
#include <EntityProject/facade/delivery_system.h>
#include "vector3D.h"
#include "json_helper.h"

namespace csci3081 {

/*******************************************************************************
 * Class Definitions
 ******************************************************************************/
/**
 * @brief The base class for creating entities.
 *
 * This class can be used as the base for all entities in the delivery system.
 * The overall design is up to you (the student), but all entities must implement
 * the IEntity interface.
 *
 */
class EntityBase : public IEntity {
 public:
    EntityBase();
    /**
    * @brief Picojson constructor for a Drone object
    * 
    * @param[in] details: details is the picojson object from which we will extract the attributed
    * of the Drone object being constructed
    * 
    */  
    EntityBase(const picojson::object& details);
    virtual ~EntityBase();
    
    /**
    * @brief Getter method for the "id" attribute of an entity
    * 
    * @return The "id" attribute of an entity
    */      
    int GetId() const;
    
    /**
    * @brief Setter method for the "id" attribute of an entity
    * 
    * @param[in] id: An int depicting the "id" attribute of an entity
    */     
    void SetId(int id);
    
    /**
    * @brief Getter method for the "name" attribute of an entity
    * 
    * @return The "name" attribute of an entity
    */
    const std::string& GetName();
    /**
    * @brief Getter method for the "position" attribute of an entity
    * 
    * @return The "position" attribute of an entity
    */
    const std::vector<float>& GetPosition() const;
    /**
    * @brief Setter method for the "position" attribute of an entity
    * 
    * @param[in] newPosition: A Vector3D object depicting the "position" attribute of an entity
    */     
    void SetPosition(Vector3D *newPosition);
    /**
    * @brief Getter method for the "direction" attribute of an entity
    * 
    * @return Vector3D object depicting the "direction" attribute of an entity
    */     
    const std::vector<float> &GetDirection() const;
    /**
    * @brief Setter method for the "direction" attribute of an entity
    * 
    * @param[in] newDirection: A Vector3D object depicting the "direction" attribute of an entity
    */         
    void SetDirection(const std::vector<float> &newDirection);
    /**
    * @brief Getter method for the "radius" attribute of an entity, which is a float.
    * 
    * @return The "radius" attribute of an entity
    */    
    float GetRadius() const;
    /**
    * @brief Getter method for the "version" attribute of an entity
    * 
    * @return The "version" attribute of an entity
    */    
    int GetVersion() const;
    /**
    * @brief Setter method for the "version" attribute of an entity
    * 
    * @param[in] newVersion: An int depicting the "version" attribute of an entity that will be used to set the version for the entity
    */         
    void SetVersion(int newVersion);
    /**
    * @brief Getter method for the "dynamic" attribute of an entity
    * 
    * @return The "dynamic" attribute of an entity
    */    
    bool IsDynamic() const;
    /**
    * @brief Getter method for the "details" attribute of an entity
    * 
    * @return The "details" attribute of an entity
    */    
    const picojson::object& GetDetails();
    /**
    * @brief Getter method for the "type" attribute of an entity
    * 
    * @return The "type" attribute of an entity
    */    
    const std::string& GetType();
  
 protected: 
    picojson::object details;
    int id;
    std::string name;
    std::string type;
    float radius;
    int version;
    bool dynamic;
    Vector3D *position;
    Vector3D *direction;

};

}  // namespace csci3081


#endif  // ENTITY_BASE_H_
