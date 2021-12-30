/**
 *@file vector3D.h
 */

#ifndef VECTOR3D_H_
#define VECTOR3D_H_

/*******************************************************************************
 * Includes
 ******************************************************************************/
#include <math.h>
#include <vector>
#include <string>

namespace csci3081 {

    class Vector3D {
        public:
            //constructors
            Vector3D();
            Vector3D(float x, float y, float z);
            Vector3D (std::vector<float> &vec);
            Vector3D(const Vector3D &vecToBeCopied);

            //getters and calculators
            float getDistanceFromPoints(const Vector3D &Point2);
            float getMagnitude();
            float getDotProduct(const Vector3D &vec);
            std::vector<float> getCrossProduct(const Vector3D &vec);
            
            /**
            * @brief A getter method for the X instance variable of the Vector3D object
            * 
            * @return: The X instance variable of the Vector3D object (this->x) 
            * 
            */
            float getX();
            /**
            * @brief A getter method for the Y instance variable of the Vector3D object
            * 
            * @return: The Y instance variable of the Vector3D object (this->y) 
            * 
            */
            float getY();
            /**
            * @brief A getter method for the Z instance variable of the Vector3D object
            * 
            * @return: The Z instance variable of the Vector3D object (this->z) 
            * 
            */
            float getZ();


            /**
            * @brief A setter method for the X instance variable of the Vector3D object
            * 
            * @param[in] f: A float variable that will be used to set this->x to
            * 
            */
            void setX(float f);

            /**
            * @brief A setter method for the Y instance variable of the Vector3D object
            * 
            * @param[in] f: A float variable that will be used to set this->y to
            * 
            */
            void setY(float f);

            /**
            * @brief A setter method for the Z instance variable of the Vector3D object
            * 
            * @param[in] f: A float variable that will be used to set this->z to
            * 
            */
            void setZ(float f);

            void Normalize();

            //overloaded operators

            /**
            * @brief Overloaded assignment operator.
            * 
            * @param[in] vec: A 3D vector that is to be assigned to a float vector
            * 
            * @return: A float vector equivalent of the 3D Vector passed in as an argument
            * 
            */
            std::vector<float, std::allocator<float>> operator=(const Vector3D &vec);
            /**
            * @brief Overloaded equality operator.
            * 
            * @param[in] vec: A Vector3D object that is to be checked for equality with another Vector3D object
            * 
            * @return: a boolean value indicating whether two Vector3D objects are equal or not
            * 
            */
            bool operator==(const Vector3D &vec);
            /**
            * @brief Overloaded addition operator.
            * 
            * @param[in] vec: A Vector3D object that is to be added to another Vector3D object
            * 
            * @return: a Vector3D object that is the sum of the two Vector3D objects
            * 
            */
            Vector3D operator+(const Vector3D &vec);
            /**
            * @brief Overloaded incrementation operator.
            * 
            * @param[in] vec: A Vector3D object that is to be added to another Vector3D object
            * 
            */
            void operator+=(const Vector3D &vec);
            /**
            * @brief Overloaded subtraction operator.
            * 
            * @param[in] vec: A Vector3D object that is to be subtracted from another Vector3D object
            * 
            * @return: a Vector3D object that is the difference between the two Vector3D objects
            * 
            */
            Vector3D operator-(const Vector3D &vec);
            /**
            * @brief Overloaded decrementation operator.
            * 
            * @param[in] vec: A Vector3D object that is to be subtracted to another Vector3D object
            * 
            */
            void operator-=(const Vector3D &vec);
            /**
            * @brief Overloaded multiplication operator.
            * 
            * @param[in] vec: A Vector3D object that is to be multiplied with another Vector3D object
            * 
            * @return: a Vector3D object that is the product of the two Vector3D objects
            * 
            */
            Vector3D operator*(float scalar);
            /**
            * @brief Overloaded multiplication assignment operator.
            * 
            * @param[in] vec: A Vector3D object that is to be multiplied to another Vector3D object
            * 
            */
            void operator*=(float scalar);
             /**
            * @brief Overloaded division operator.
            * 
            * @param[in] vec: A Vector3D object that is to be divided from another Vector3D object
            * 
            * @return: a Vector3D object that is the division between the two Vector3D objects
            * 
            */
            Vector3D operator/(float scalar);
             /**
            * @brief Overloaded division assignment operator.
            * 
            * @param[in] vec: A Vector3D object that is to be divided from another Vector3D object
            * 
            */
            void operator/=(float scalar);

            
            //conversion to vector<float>
            /**
            * @brief Conversion from a Vector3D object to a float vector
            * 
            * @param[in] vec: A Vector3D object that is to be used for the conversion.
            * 
            * @return: a vector of floats that is the equivalent of the Vector3D object that is passed in
            * 
            */
            std::vector<float> &toFloatVec(Vector3D &vec);

            /**
            * @brief The method to calculate distance between two Vector3D objects
            * 
            * @param[in] pos1: A Vector3D object that is to be used to find the distance.
            * 
            * @param[in] pos2: A Vector3D object that is to be subtracted from the first Vector3D object to find the distance.
            * 
            * @return: A Vector3D object that is the distance between two Vector3D objects passed in as arguments
            * 
            */
            Vector3D* findDistance(Vector3D &pos1, std::vector<float> &pos2);

            bool isEqual(Vector3D* pos2);

        private:
            float x;
            float y;
            float z;
            std::vector<float> temp;
    };
}

#endif