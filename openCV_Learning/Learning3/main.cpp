#include <iostream>
#include <cv.h>
#include <highgui.h>
#include "opencv2/opencv.hpp"
#include <algorithm>

using namespace cv;
using namespace std;

int main()
{
    Mat img;
    img=imread("C:\\Users\\admin\\Desktop\\PotatoDatabase\\Original.jpg",1);
    imshow("Original",img);
    Mat imgNew;
    imgNew=imread("C:\\Users\\admin\\Desktop\\PotatoDatabase\\New.jpg",1);
    imshow("New",imgNew);
    Mat imgChange;
    absdiff(imgNew,img,imgChange);
    imshow("Background Change",imgChange);
    Mat imgGray;
    cvtColor(imgChange, imgGray, CV_BGR2GRAY);
    imshow("GrayScale image",imgGray);
    Mat imgBw;
    //Otsu thresholding operation
    threshold( imgGray, imgBw, 0, 255, CV_THRESH_BINARY | CV_THRESH_OTSU );
    imshow("BW image", imgBw);
    Mat imgDilute;
    dilate(imgBw,imgDilute, getStructuringElement(MORPH_ELLIPSE, Size(3,3), Point(-1,-1)));
    Mat imgErode;
    dilate(imgDilute,imgErode, getStructuringElement(MORPH_ELLIPSE, Size(3,3), Point(-1,-1)));
    imshow("Eroded image", imgErode);
    Mat dst = Mat::zeros(imgErode.rows, imgErode.cols, CV_8UC3);
    vector<vector<Point> > contours;
    vector<Vec4i> hierarchy;
    //cout<<contours.front().front()<<endl;
    findContours( imgErode, contours, hierarchy,
        CV_RETR_CCOMP, CV_CHAIN_APPROX_SIMPLE );
        // iterate through all the top-level contours,
    // draw each connected component with its own random color
    int idx = 0;
    for( ; idx >= 0; idx = hierarchy[idx][0] )
    {
        Scalar color( rand()&255, rand()&255, rand()&255 );
        drawContours( dst, contours, idx, color, CV_FILLED, 8, hierarchy );
    }
    int num=contours.size();
    //cout<<"Number of contours is"<< contours.size()<<endl;
    //cout<<"Max element is"<<max_element(contours,contours)<<endl;
    for(int i=0;i<num;i++)
    {
     cout << "Contour area is" << contourArea(contours[i])<<endl ;
    }

    namedWindow( "Components", 1 );
    imshow( "Components", dst );
    vector<vector<Point> > contours_poly( contours.size() );
  vector<Rect> boundRect( contours.size() );

    for( int i = 0; i < contours.size(); i++ )
     { approxPolyDP( Mat(contours[i]), contours_poly[i], 3, true );
       boundRect[i] = boundingRect( Mat(contours_poly[i]) );
     }

     Mat drawing = Mat::zeros( threshold_output.size(), CV_8UC3 );
  for( int i = 0; i< contours.size(); i++ )
     {
       Scalar color = Scalar( rng.uniform(0, 255), rng.uniform(0,255), rng.uniform(0,255) );
       drawContours( drawing, contours_poly, i, color, 1, 8, vector<Vec4i>(), 0, Point() );
       rectangle( drawing, boundRect[i].tl(), boundRect[i].br(), color, 2, 8, 0 );
       circle( drawing, center[i], (int)radius[i], color, 2, 8, 0 );
     }

     namedWindow( "Contours", CV_WINDOW_AUTOSIZE );
  imshow( "Contours", drawing );

    waitKey();
    return 0;
}
