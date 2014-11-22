function H2to1= computeH( p1,p2 )
N=size(p1,2);
A=[];
for i=1:N
    %Ax=[-p2(1,i) -p2(2,i) -1 0 0 0 p2(1,i)*p1(1,i) p2(2,i)*p1(1,i) p1(1,i); 0 0 0 -p2(1,i) -p2(2,i) -1 p2(1,i)*p1(2,i) p2(2,i)*p1(2,i) p1(2,i)];
%     Ax=[-p1(1,i) -p1(2,i) -1 0 0 0 p1(1,i)*p2(1,i) p2(2,i)*p2(1,i) p2(1,i); 0 0 0 -p1(1,i) -p1(2,i) -1 p1(1,i)*p2(2,i) p1(2,i)*p2(2,i) p2(2,i)];
Ax=[-p1(1,i) -p1(2,i) -1 0 0 0 p1(1,i)*p2(1,i) p1(2,i)*p2(1,i) p2(1,i); 0 0 0 -p1(1,i) -p1(2,i) -1 p1(1,i)*p2(2,i) p1(2,i)*p2(2,i) p2(2,i)];
    A=[A;Ax];
end
[U,S,V] = svd(A);
h1=V(:,9);
h1=reshape(h1,3,3);        
H2to1=h1';
end

