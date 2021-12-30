#include "vector2D.h"
using namespace std;
namespace csci3081
{
    Vector2D::Vector2D(){
        x = 0;
        y = 0;
        z = 0;
    }

    Vector2D::Vector2D(std::vector<float> &vec2){
        this->x = vec2[0];
        this->y = 0;
        this->z = vec2[2];
    }

    Vector2D::Vector2D(float x, float y, float z){
        this->x = x;
        this->y = 0;
        this->z = z;
    }

    Vector2D::Vector2D(const Vector2D &vecToBeCopied){
        this->x = vecToBeCopied.x;
        this->y = 0;
        this->z = vecToBeCopied.z;
    }

    float Vector2D::getDistanceFromPoints(const Vector2D &Point2){
        float xDist = (this->x-Point2.x)*(this->x-Point2.x);
        float zDist = (this->z-Point2.z)*(this->z-Point2.z);
        return sqrt(xDist + zDist);
    }

    float Vector2D::getMagnitude(){
        float xSqr = x*x;
        float zSqr = z*z;
        return sqrt(xSqr+zSqr);
    }

    float Vector2D::getDotProduct(const Vector2D &vec){
        return this->x*vec.x + this->z*vec.z;
    }

    float Vector2D::getX(){
        return this->x;
    }

    float Vector2D::getZ(){
        return this->z;
    }

    void Vector2D::setX(float f){
        this->x = f;
    }

    void Vector2D::setZ(float f){
        this->z = f;
    }

    void Vector2D::Normalize(){
        this->x/= this->getMagnitude();
        this->y/= this->getMagnitude();
        this->z/= this->getMagnitude();
    }

    bool Vector2D::operator==(const Vector2D &vec){
        bool xEqual = this->x==vec.x;
        bool yEqual = this->y==vec.y;
        bool zEqual = this->y==vec.y;
        return (xEqual && yEqual && zEqual);
    }

    Vector2D Vector2D::operator+(const Vector2D &vec){
        Vector2D Vector2;
        Vector2.x = this->x+vec.x;
        Vector2.z = this->z+vec.z;
        return Vector2;
    }

    void Vector2D::operator+=(const Vector2D &vec){
        this->x+=vec.x;
        this->z+=vec.z;
    }

    Vector2D Vector2D::operator-(const Vector2D &vec){
        Vector2D Vector2;
        Vector2.x = this->x-vec.x;
        Vector2.z = this->z-vec.z;
        return Vector2;
    }

    void Vector2D::operator-=(const Vector2D &vec){
        this->x-=vec.x;
        this->z-=vec.z;
    }

    Vector2D Vector2D::operator*(float scalar){
        Vector2D Vector2;
        Vector2.x = this->x*scalar;
        Vector2.z = this->z*scalar;
        return Vector2;
    }

    void Vector2D::operator*=(float scalar){
        this->x*=scalar;
        this->z*=scalar;
    }

    Vector2D Vector2D::operator/(float scalar){
        Vector2D Vector2;
        Vector2.x = this->x/scalar;
        Vector2.z = this->z/scalar;
        return Vector2;
    }

    void Vector2D::operator/=(float scalar){
        this->x/=scalar;
        this->z/=scalar;
    }

    std::vector<float> &Vector2D::toFloatVec(const Vector2D &vec){
        this->temp = {vec.x, vec.z};
        return this->temp;
    }
}