/**
 * @file passenger.h
 *
 * @copyright 2019 3081 Staff, All rights reserved.
 */


#ifndef PASSENGER_H
#define PASSENGER_H
/*******************************************************************************
 * Includes
 ******************************************************************************/
#include <iostream>
#include <string>

/*******************************************************************************
 * Class Definitions
 ******************************************************************************/
/**
 * @brief The Passenger class responsible for the instantiation of a passenger object.
 *
 *  A new instance of a Passenger object is created by a call to \ref
 *  This is a static call, not requiring an instance to invoke the method.
 */

class Passenger { // : public Reporter {
 public:
/**
  * @brief This is the constructor for the Passenger Class.
  * This function will be used for simulation purposes.
  *
  * @param[in] The integer that depicts the current ID of the passenger. By default, set to -1.
  * @param[in] The string describing the name of the passenger. By default, set to "Nobody"
  */
  Passenger(int = -1, std::string = "Nobody");

  void Update();

  void GetOnBus();

  int GetTotalWait() const;

  bool IsOnBus() const;

  int GetDestination() const;
  /**
  * @brief The Report() method prints the attributes of a passenger object.
  * 
  * The passenger object contains the following attributes that will be printed in this order: 
  * 'Name',
  * 'Destination', 
  * 'Total Wait', 
  * 'Wait at Stop', 
  * 'Time on bus' 
  *
  */
  void Report() const;

 private:

  std::string name_;

  int destination_stop_id_;

  int wait_at_stop_;

  int time_on_bus_;

  int id_;

  static int count_;  // global count, used to set ID for new instances
  
};
#endif