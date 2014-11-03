#include <iostream>
#include <cv.h>
#include <highgui.h>

using namespace cv;
using namespace std;

int main()
{
    Mat img;
    img=imread("C:\\Users\\admin\\Desktop\\gunj.jpg",1);
    imshow("Trial",img);
    waitKey();
    return 0;
}
