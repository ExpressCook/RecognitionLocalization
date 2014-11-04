int computeH()
{
        int N=p1.cols();
        Mat A;
        for i=1:N
            {
                Mat Ax=[-p1(1,i) -p1(2,i) -1 0 0 0 p1(1,i)*p2(1,i) p1(2,i)*p2(1,i) p2(1,i); 0 0 0 -p1(1,i) -p1(2,i) -1 p1(1,i)*p2(2,i) p1(2,i)*p2(2,i) p2(2,i)];
                A.push_back(Ax);
            }
        Mat AtoMul=A.t()*A;
        Mat eigenValues;
        bool eigen(AtoMul, eigenValues);
        //h1=V(:,9);
        //h1=reshape(h1,3,3);
        //H2to1=h1';
        return ;
}
