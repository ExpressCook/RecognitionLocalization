imgPaths='C:\Users\admin\Desktop\PotatoDatabase';
% sMinPotato=zeros(1,10);
% sMaxPotato=zeros(1,10);
sAvgPotatoRed=zeros(1,10);
sAvgPotatoBlue=zeros(1,10);
sAvgPotatoGreen=zeros(1,10);
% sMinPotatoRed=zeros(1,10);
% sMinPotatoGreen=zeros(1,10);
% sMinPotatoBlue=zeros(1,10);
% sMaxPotatoRed=zeros(1,10);
% sMaxPotatoGreen=zeros(1,10);
% sMaxPotatoBlue=zeros(1,10);
for i=1:15
imgName=fullfile(imgPaths,strcat('potato',num2str(i),'.jpg'));
I=imread(imgName);
% I=rgb2hsv(I);
% sMinPotato(i)=min(min(I(:,:,2)));
% sMaxPotato(i)=max(max(I(:,:,2)));
sAvgPotatoRed(i)=(sum(sum(I(:,:,1))))/numel(I(:,:,1));
sAvgPotatoGreen(i)=(sum(sum(I(:,:,2))))/numel(I(:,:,2));
sAvgPotatoBlue(i)=(sum(sum(I(:,:,3))))/numel(I(:,:,3));
% sMinPotatoRed(i)=min(min(I(:,:,1)));
% sMinPotatoGreen(i)=min(min(I(:,:,2)));
% sMinPotatoBlue(i)=min(min(I(:,:,3)));
% sMaxPotatoRed(i)=max(max(I(:,:,1)));
% sMaxPotatoBlue(i)=max(max(I(:,:,2)));
% sMaxPotatoGreen(i)=max(max(I(:,:,3)));

end
% sRangePotato=[median(sMinPotatoRed) median(sMaxPotatoRed);median(sMinPotatoGreen) median(sMaxPotatoGreen);median(sMinPotatoBlue) median(sMaxPotatoBlue)];
sRangePotato=[min(sAvgPotatoRed) max(sAvgPotatoRed);min(sAvgPotatoGreen) max(sAvgPotatoGreen);min(sAvgPotatoBlue) max(sAvgPotatoBlue)];


imgPaths='C:\Users\admin\Desktop\AppleDatabase';
% sMinApple=zeros(1,10);
% sMaxApple=zeros(1,10);
sAvgAppleRed=zeros(1,10);
sAvgAppleGreen=zeros(1,10);
sAvgAppleBlue=zeros(1,10);
% sMinAppleRed=zeros(1,10);
% sMinAppleGreen=zeros(1,10);
% sMinAppleBlue=zeros(1,10);
% sMaxAppleRed=zeros(1,10);
% sMaxAppleGreen=zeros(1,10);
% sMaxAppleBlue=zeros(1,10);
for i=1:15
imgName=fullfile(imgPaths,strcat('apple',num2str(i),'.jpg'));
I=imread(imgName);
% I=rgb2hsv(I);
% sMinApple(i)=min(min(I(:,:,2)));
% sMaxApple(i)=max(max(I(:,:,2)));
sAvgAppleRed(i)=(sum(sum(I(:,:,1))))/numel(I(:,:,1));
sAvgAppleGreen(i)=(sum(sum(I(:,:,2))))/numel(I(:,:,2));
sAvgAppleBlue(i)=(sum(sum(I(:,:,3))))/numel(I(:,:,3));
% sMinAppleRed(i)=min(min(I(:,:,1)));
% sMinAppleGreen(i)=min(min(I(:,:,2)));
% sMinAppleBlue(i)=min(min(I(:,:,3)));
% sMaxAppleRed(i)=max(max(I(:,:,1)));
% sMaxAppleBlue(i)=max(max(I(:,:,2)));
% sMaxAppleGreen(i)=max(max(I(:,:,3)));

end
% sRangeApple=[median(sMinAppleRed) median(sMaxAppleRed);median(sMinAppleGreen) median(sMaxAppleGreen);median(sMinAppleBlue) median(sMaxAppleBlue)];
sRangeApple=[min(sAvgAppleRed) max(sAvgAppleRed);min(sAvgAppleGreen) max(sAvgAppleGreen);min(sAvgAppleBlue) max(sAvgAppleBlue)];
