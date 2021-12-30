#include <iostream>
#include "math.h"
#include "point2.h"
using namespace std;

Point2::Point2(){
    this->x = 0;
    this->y = 0;
}

Point2::Point2(float x, float y){
    this->x = x;
    this->y = y;
}

float Point2::DistanceBetween(Point2 cluster){
    return sqrt(pow((cluster.x-this->x),2)+pow((cluster.y-this->y),2));
}

int Point2::Quadrant(){
    
    if (this->x == 0 && this->y == 0) {
        return 0;
    }
    else if (this->x > 0 && this->y >= 0) {
        return 1;
    }
    else if (this->x <= 0 && this->y > 0) {
        return 2;
    }
    else if (this->x < 0 && this->y <= 0) {
        return 3;
    }
    
    return 4;
}
void Point2::Print(){
    cout << "The coordinate of the point is: " << this->x << this->y << endl;
}