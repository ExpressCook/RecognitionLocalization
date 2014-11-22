%% Getting image features for Potatoes
imgPaths='C:\Users\Tamias65\Desktop\PotatoDatabase\PotatoDatabase';
sAvgPotatoRed=zeros(1,10);
sAvgPotatoBlue=zeros(1,10);
sAvgPotatoGreen=zeros(1,10);
for i=1:15
imgName=fullfile(imgPaths,strcat('potato',num2str(i),'.jpg'));
I=imread(imgName);
%I=rgb2hsv(I);
sAvgPotatoRed(i)=(sum(sum(I(:,:,1))))/numel(I(:,:,1));
sAvgPotatoGreen(i)=(sum(sum(I(:,:,2))))/numel(I(:,:,2));
sAvgPotatoBlue(i)=(sum(sum(I(:,:,3))))/numel(I(:,:,3));
end
sRangePotato=[min(sAvgPotatoRed) max(sAvgPotatoRed);min(sAvgPotatoGreen) max(sAvgPotatoGreen);min(sAvgPotatoBlue) max(sAvgPotatoBlue)];

%%Now, getting image features for Apples
imgPaths='C:\Users\Tamias65\Desktop\AppleDatabase\AppleDatabase';
sAvgAppleRed=zeros(1,10);
sAvgAppleGreen=zeros(1,10);
sAvgAppleBlue=zeros(1,10);
for i=1:15
imgName=fullfile(imgPaths,strcat('apple',num2str(i),'.jpg'));
I=imread(imgName);
%I=rgb2hsv(I);
sAvgAppleRed(i)=(sum(sum(I(:,:,1))))/numel(I(:,:,1));
sAvgAppleGreen(i)=(sum(sum(I(:,:,2))))/numel(I(:,:,2));
sAvgAppleBlue(i)=(sum(sum(I(:,:,3))))/numel(I(:,:,3));
end
sRangeApple=[min(sAvgAppleRed) max(sAvgAppleRed);min(sAvgAppleGreen) max(sAvgAppleGreen);min(sAvgAppleBlue) max(sAvgAppleBlue)];
