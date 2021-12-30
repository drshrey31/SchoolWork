class Point2{
    public:
        Point2();
        Point2(float x, float y);
        float DistanceBetween(Point2 cluster);
        int Quadrant();
        void Print();
    private:
        float x, y;
};
