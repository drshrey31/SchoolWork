/**
 *@file vector2D.h
 */

#ifndef VECTOR2D_H_
#define VECTOR2D_H_

/*******************************************************************************
 * Includes
 ******************************************************************************/
#include "entity_base.h"
#include <vector>
#include <string>

namespace csci3081 {

    class Vector2D {
        public:
            Vector2D();
            Vector2D(float x, float y, float z);
            // ~Vector2D();
            Vector2D(std::vector<float> &vec2);

            void Normalize();

            /**
            * @brief A getter method for the X instance variable of the Vector2D object
            * 
            * @return: The X instance variable of the Vector2D object (this->x) 
            * 
            */
            float getX();

            /**
            * @brief A getter method for the Z instance variable of the Vector2D object
            * 
            * @return: The Z instance variable of the Vector2D object (this->z) 
            * 
            */
            float getZ();

            /**
            * @brief A setter method for the X instance variable of the Vector2D object
            * 
            * @param[in] f: A float variable that will be used to set this->x to
            * 
            */
            void setX(float f);

            /**
            * @brief A setter method for the Z instance variable of the Vector2D object
            * 
            * @param[in] f: A float variable that will be used to set this->z to
            * 
            */
            void setZ(float f);

            Vector2D(const Vector2D &vecToBeCopied);

            float getDistanceFromPoints(const Vector2D &Point2);
            float getMagnitude();
            float getDotProduct(const Vector2D &vec);
            bool  operator==(const Vector2D &vec);
            void  operator=(const std::vector<float> &vec);
            Vector2D  operator+(const Vector2D &vec);
            Vector2D  operator+(const std::vector<float> &vec);
            void  operator+=(const Vector2D &vec);
            void  operator+=(const std::vector<float> &vec); 
            Vector2D  operator-(const Vector2D &vec);
            Vector2D  operator-(const std::vector<float> &vec);
            void  operator-=(const Vector2D &vec);
            void  operator-=(const std::vector<float> &vec);
            Vector2D  operator*(float value);
            void  operator*=(float value);
            Vector2D  operator/(float value);
            void  operator/=(float value);

            std::vector<float> &toFloatVec(const Vector2D &vec);
            
        private:
            float x;
            float y;
            float z;
            vector<float> temp;
    };
}

#endif