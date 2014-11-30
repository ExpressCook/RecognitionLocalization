testMatrix=zeros(640,640);
for i=1:640
for j=1:640
if((changeHSV(i,j,3)>0.1) && ((changeHSV(i,j,1)>0.0 && changeHSV(i,j,1)<0.05) || (changeHSV(i,j,1)>0.9 && changeHSV(i,j,1)<1.0)))
testMatrix(i,j)=1;
end
end
end
figure,imshow(255*testMatrix)
