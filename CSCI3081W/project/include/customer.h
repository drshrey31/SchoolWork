/**
 *@file customer.h
 */
#ifndef CUSTOMER_H_
#define CUSTOMER_H_

/*******************************************************************************
 * Includes
 ******************************************************************************/

#include "entity_base.h"
#include <vector>
#include <string>


namespace csci3081 {
/*******************************************************************************
 * Class Definitions
 ******************************************************************************/
/**
 * @brief The class for creating Customers.
 *
 * This class is used to define the parameters and attributes of a Customer in the drone package delivery simulation.
 *
 */
    class Customer : public csci3081::EntityBase {
        public:
            Customer();
            ~Customer();
            /**
            * @brief Picojson constructor for a Customer object
            * 
            * @param[in] details: details is the picojson object from which we will extract the attributed
            * of the Customer object being constructed
            * 
            */  
            Customer(const picojson::object& details);

            /**
             * @brief Package copy constructor: This method copies the attributes of the Customer object of choice (passed in as the argument).
             * 
             * @param[in] customer2: customer2 is the Customer whose attributes are going to be copied over to the calling Customer object.
             * 
            */
            Customer (const Customer &customer2);
            
    };
}

#endif