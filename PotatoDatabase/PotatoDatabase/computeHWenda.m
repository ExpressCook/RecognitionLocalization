function H2to1 = computeHWenda(p1,p2)

    assert(size(p1,2)==size(p2,2), 'wrong columns');
    assert(size(p1,1)==2, 'wrong p1 lines');
    assert(size(p2,1)==2, 'wrong p2 lines');    
    N = size(p1,2);
   
    htp2 = [p2' ones(N,1)];
    k1 = kron(eye(N), [1;0]);
    k2 = kron(eye(N), [0;1]);
    
    k1htp2 = k1*htp2;
    k2htp2 = k2*htp2;
    
    a3 = -bsxfun(@times, k1htp2+k2htp2, p1(:));
    
    A = [k1htp2, k2htp2, a3];
    [v,d] = eig(A'*A);
    [~,I] = min(sum(d));
    H2to1 = reshape(v(:,I),3,3)'; 
    
end