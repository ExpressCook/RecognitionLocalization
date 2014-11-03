#include <iostream>
#include <cv.h>
#include <highgui.h>
#include "opencv2/opencv.hpp"

using namespace cv;
using namespace std;

int main()
{
    Mat img;
    img=imread("C:\\Users\\admin\\Desktop\\gunj.jpg",1);
    imshow("Trial",img);
    VideoCapture cap(0);
    //bool ans=cap.get(CV_CAP_PROP_CONVERT_RGB);
    //cout<<ans;
    if(!cap.isOpened())  // check if we succeeded
        return -1;
    Mat edges;
    namedWindow("edges",1);
    Mat frame;
        cap >> frame; // get a new frame from camera
        //cout<<cap.get(CV_CAP_PROP_FRAME_WIDTH)<<endl;
        //cout<<cap.get(CV_CAP_PROP_FRAME_HEIGHT)<<endl;
        //cout<<frame.size()<<endl;
        //std::cerr << "image chans : " << frame.channels() << std::endl;
        cvtColor(frame, edges, CV_BGR2GRAY);
        //cout<<edges.size()<<endl;
        GaussianBlur(edges, edges, Size(7,7), 1.5, 1.5);
        Canny(edges, edges, 0, 30, 3);
        imshow("edges", edges);
    waitKey();
    return 0;
}
