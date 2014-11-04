#include <iostream>
#include <cv.h>
#include <highgui.h>
#include "opencv2/opencv.hpp"
#include <algorithm>

using namespace cv;
using namespace std;

RNG rng(12345);

int main()
{
    Mat img;
    img=imread("C:\\Users\\admin\\Desktop\\PotatoDatabase\\Original.jpg",1);
    cout<<img.type()<<endl;
    imshow("Original",img);
    vector <Point2f> srcPoints;
    vector <Point2f> dstPoints;
    srcPoints.push_back(Point2f(32,2));
    srcPoints.push_back(Point2f(136,2));
    srcPoints.push_back(Point2f(21,119));
    srcPoints.push_back(Point2f(159,120));
    dstPoints.push_back(Point2f(1,1));
    dstPoints.push_back(Point2f(160,1));
    dstPoints.push_back(Point2f(1,120));
    dstPoints.push_back(Point2f(160,120));
    Mat H;
    Mat img_out = Mat::zeros( img.size(), CV_8UC3 );
    H=findHomography(srcPoints, dstPoints, 0, 3);
    warpPerspective(img, img_out, H, img.size(), 1, 1);
    imshow("warped original",img_out);
    Mat imgNew;
    imgNew=imread("C:\\Users\\admin\\Desktop\\PotatoDatabase\\New.jpg",1);
    Mat imgNew_out = Mat::zeros( imgNew.size(), CV_8UC3 );
    imshow("New",imgNew);
    warpPerspective(imgNew, imgNew_out, H, imgNew.size(), 1, 1);
    imshow("Warped New", imgNew_out);
    Mat imgChange;
    absdiff(imgNew_out,img_out,imgChange);
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
    cout<<"Bounding Rectangles"<<endl;
    vector<vector<Point> > contours_poly( contours.size() );
  vector<Rect> boundRect( contours.size() );
  vector<Point> centroids;

    for( int i = 0; i < contours.size(); i++ )
     { approxPolyDP( Mat(contours[i]), contours_poly[i], 3, true );
       boundRect[i] = boundingRect( Mat(contours_poly[i]) );
       /*TL.push_back(boundRect[i].tl());
       BR.push_back(boundRect[i].br());
       Point t=TL.at(i);
       Point b=BR.at(i);*/
       centroids.push_back(Point((boundRect[i].br().x+boundRect[i].tl().x)/2.0,(boundRect[i].br().y+boundRect[i].tl().y)/2));
       //cout<<boundRect[i].tl().x<<"\t"<<boundRect[i].br().x<<endl;
       cout<<centroids.at(i)<<endl;
     }
cout<<"Bounding Rectangles ended"<<endl;
     Mat drawing = Mat::zeros( dst.size(), CV_8UC3 );
  for( int i = 0; i< contours.size(); i++ )
     {
       Scalar color = Scalar( rng.uniform(0, 255), rng.uniform(0,255), rng.uniform(0,255) );
       drawContours( drawing, contours_poly, i, color, 1, 8, vector<Vec4i>(), 0, Point() );
       rectangle( drawing, boundRect[i].tl(), boundRect[i].br(), color, 2, 8, 0 );
       circle(drawing, centroids.at(i),2.0,color,-1,8,0);
     }

     namedWindow( "Contours", CV_WINDOW_AUTOSIZE );
  imshow( "Contours", drawing );

    waitKey();
    return 0;
}
