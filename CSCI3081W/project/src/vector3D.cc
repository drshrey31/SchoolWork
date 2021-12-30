#include "vector3D.h"
using namespace std;
namespace csci3081
{
    Vector3D::Vector3D(){
        x = 0;
        y = 0;
        z = 0;
    }

    Vector3D::Vector3D(std::vector<float> &vec){
        this->x = vec[0];
        this->y = vec[1];
        this->z = vec[2];
    }

    Vector3D::Vector3D(float x, float y, float z){
        this->x = x;
        this->y = y;
        this->z = z;
    }

    Vector3D::Vector3D(const Vector3D &vecToBeCopied){
        this->x = vecToBeCopied.x;
        this->y = vecToBeCopied.y;
        this->z = vecToBeCopied.z;
    }

    float Vector3D::getDistanceFromPoints(const Vector3D &Point2){
        float xDist = (this->x-Point2.x)*(this->x-Point2.x);
        float yDist = (this->y-Point2.y)*(this->y-Point2.y);
        float zDist = (this->z-Point2.z)*(this->z-Point2.z);
        return sqrt(xDist + yDist + zDist);
    }

    float Vector3D::getMagnitude(){
        float xSqr = x*x;
        float ySqr = y*y;
        float zSqr = z*z;
        return sqrt(xSqr+ySqr+zSqr);
    }

    float Vector3D::getDotProduct(const Vector3D &vec){
        float product = 0.0;
        product += this->x*vec.x;
        product += this->y*vec.y;
        product += this->z*vec.z;
        return product;
    }

    std::vector<float> Vector3D::getCrossProduct(const Vector3D &vec){
        std::vector<float> Vector2;
        Vector2[0] = vec.z*this->y-vec.y*this->z;
        Vector2[1] = vec.z*this->x-vec.x*this->z;
        Vector2[2] = vec.y*this->x-vec.x*this->y;
        return Vector2;
    }

    float Vector3D::getX(){
        return this->x;
    }

    float Vector3D::getY(){
        return this->y;
    }

    float Vector3D::getZ(){
        return this->z;
    }

    void Vector3D::setX(float f){
        this->x = f;
    }

    void Vector3D::setY(float f){
        this->y = f;
    }

    void Vector3D::setZ(float f){
        this->z = f;
    }

    void Vector3D::Normalize(){
        this->x/= this->getMagnitude();
        this->y/= this->getMagnitude();
        this->z/= this->getMagnitude();
    }

    bool Vector3D::operator==(const Vector3D &vec){
        bool xEqual = this->x==vec.x;
        bool yEqual = this->y==vec.y;
        bool zEqual = this->y==vec.y;
        return (xEqual && yEqual && zEqual);
    }

    Vector3D Vector3D::operator+(const Vector3D &vec){
        Vector3D Vector2;
        Vector2.x = this->x+vec.x;
        Vector2.y = this->y+vec.y;
        Vector2.z = this->z+vec.z;
        return Vector2;
    }

    void Vector3D::operator+=(const Vector3D &vec){
        this->x+=vec.x;
        this->y+=vec.y;
        this->z+=vec.z;
    }

    Vector3D Vector3D::operator-(const Vector3D &vec){
        Vector3D Vector2;
        Vector2.x = this->x-vec.x;
        Vector2.y = this->y-vec.y;
        Vector2.z = this->z-vec.z;
        return Vector2;
    }

    void Vector3D::operator-=(const Vector3D &vec){
        this->x-=vec.x;
        this->y-=vec.y;
        this->z-=vec.z;
    }

    Vector3D Vector3D::operator*(float scalar){
        Vector3D Vector2;
        Vector2.x = this->x*scalar;
        Vector2.y = this->y*scalar;
        Vector2.z = this->z*scalar;
        return Vector2;
    }

    void Vector3D::operator*=(float scalar){
        this->x*=scalar;
        this->y*=scalar;
        this->z*=scalar;
    }

    Vector3D Vector3D::operator/(float scalar){
        Vector3D Vector2;
        Vector2.x = this->x/scalar;
        Vector2.y = this->y/scalar;
        Vector2.z = this->z/scalar;
        return Vector2;
    }

    void Vector3D::operator/=(float scalar){
        this->x/=scalar;
        this->y/=scalar;
        this->z/=scalar;
    }

    std::vector<float> &Vector3D::toFloatVec(Vector3D &vec){
        temp = {vec.x, vec.y, vec.z};
        return temp;
    }

    Vector3D* Vector3D::findDistance(Vector3D &pos1, std::vector<float> &pos2){
        float newX = -(pos1.getX() - pos2[0]);
        float newY = -(pos1.getY() - pos2[1]);
        float newZ = -(pos1.getZ() - pos2[2]);
        return new Vector3D(newX, newY, newZ);
    }

  bool Vector3D::isEqual(Vector3D* pos2){
      if (this->getX() >= pos2->getX()){
          if (this->getY() >= pos2->getY()){
              if (this->getZ() >= pos2->getZ()){
                  return true;
              }
          }
      }
      return false;
  }

}