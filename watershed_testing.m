close all
clear all
clc

% i=imread('./AppleDatabase/apple15.jpg');
i=imread('/home/sugandha/Downloads/img1.png');
figure, imshow(i)
gray=rgb2gray(i);
figure,imshow(gray)
se=strel('disk',20);

hy = fspecial('log',[9 9], 0.9);
%log worked pretty well
hx = hy';
Iy = imfilter(double(gray), hy, 'replicate');
Ix = imfilter(double(gray), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);
figure,imshow(gradmag)

% % % Performing opening and closing using imerode and imdilate functions
% % i_open=imopen(gray,se);
% % figure,imshow(i_open)
% % i_close=imclose(i_open,se);
% % figure, imshow(i_close)

%Performing opening by reconstruction
i_erode=imerode(gray,se);
i_openByRecon=imreconstruct(i_erode, gray);
figure, imshow(i_openByRecon)

%Next, perform closing by reconstruction
i_dilate=imdilate(i_openByRecon,se);
i_closeByRecon=imcomplement(imreconstruct(imcomplement(i_dilate), imcomplement(i_openByRecon)));
figure,imshow(i_closeByRecon)

%Extract the sure foreground
fgm = imregionalmax(i_closeByRecon);
figure,imshow(fgm)

%Visualise by superimposing markers over original image
I2 = i;
I2(fgm) = 255;
figure,imshow(I2)

%Performing morphological operations to obtain cleaner objects
se2 = strel(ones(5,5));
fgm2 = imclose(fgm, se2);
fgm3 = imerode(fgm2, se2);

%bwareaopne to close the small openings the resultant image ie removing
%blobs that fewer than a certain no of pixels
fgm4 = bwareaopen(fgm3, 20);
I3 = i;
I3(fgm4) = 255;
figure, imshow(I3)

%Next, proceed to generating background markers
% Convert image to BW
bw=im2bw(i_closeByRecon, graythresh(i_closeByRecon));
figure, imshow(bw)

%Computing watershed transform of distance transform of bw and looking for
%ridge lines (DL==0)
D = bwdist(bw);
figure,imshow(D)
DL = watershed(D);
bgm = DL == 0;
figure, imshow(bgm)

%Compute watershed transform of segmentation function
gradmag2 = imimposemin(gradmag, bgm | fgm4);
L = watershed(gradmag2);

%As a last step, visualize the result
I4 = i;
I4(imdilate(L == 0, ones(3, 3)) | bgm | fgm4) = 255;
figure, imshow(I4)

Lrgb = label2rgb(L, 'hsv', 'w', 'noshuffle');
figure, imshow(Lrgb)

% %Converting the segmented img to bw to extract bounding boxes
% img_segmented=rgb2gray(Lrgb);
% img_segmented=im2bw(img_segmented,graythresh(img_segmented));
% 
% IL = bwlabel(img_segmented);
R = regionprops(L,'Area');
area=cat(1,R.Area);
[areaSorted,ind]=sort(area,'descend')
