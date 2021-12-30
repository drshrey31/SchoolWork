///\file
#include "battery.h"

namespace csci3081 {
    Battery::Battery (){
        this->batteryMax = 100;
        this->remainingBattery = 50;
        this->status = true;
    }
    Battery::Battery(int batteryMax, int remainingBattery, bool status){
        this->batteryMax = batteryMax;
        this->remainingBattery = remainingBattery;
        this->status = status;
    }
    bool Battery::isDead(){
        return !this->status;
    }
    int Battery::getBatteryLevel(){
        return this->remainingBattery;
    }
    int Battery::getMaxCharge(){
        return this->batteryMax;
    }
}