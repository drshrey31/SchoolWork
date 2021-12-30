/**
 *@file battery.h
 */

#ifndef BATTERY_H_
#define BATTERY_H_

/*******************************************************************************
 * Includes
 ******************************************************************************/

#include <string>
#include <ctime>

namespace csci3081 {

/*******************************************************************************
 * Class Definitions
 ******************************************************************************/
/**
 * @brief This is the Battery Class
 *
 * This class will delegate operations for the whole Customer delivery system.
 * 
 * 
 */
    class Battery{
    public:
        Battery ();
        
        /**
        * @brief Overloaded Battery Constructor
        * orders sections 
        * 
        * @param[in] batteryMax: The max capacity for the battery
        * 
        * @param[in] remainingBattery: The remaining amount of battery 
        * 
        * @param[in] status: The status of the battery alive (true), or dead (false).
        * 
        * @return: Battery Object 
        * 
        */
        Battery(int batteryMax, int remainingBattery, bool status);
        
        /**
        * @brief isDead: the method to check whether battery is dead or alive
        * 
        * @return: the status attribute of the Battery object.
        * 
        */
        bool isDead();
        
        /**
        * @brief getBatteryLevel: the method to get the current battery level of the Battery object
        * 
        * @return: the remainingBattery attribute of the Battery object.
        * 
        */        
        int getBatteryLevel();
        
        /**
        * @brief getMaxCharge: the method to get the current max battery capactity of the Battery object
        * 
        * @return: the batteryMax attribute of the Battery object.
        * 
        */        
        int getMaxCharge();

    private: 
        int remainingBattery;
        int batteryMax;
        bool status; // true = alive, false = dead

    };
}

#endif
