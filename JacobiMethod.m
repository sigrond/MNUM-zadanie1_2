function [ xk ] = JacobiMethod( A, b )
%JacobiMethod implementacja metody Jacobiego
%   Rozwi¹zywanie ukadw rwnañ liniowych
n=size(A,1);
xk=zeros(n,1);
k=0;
stop=false;
t0=tic;
while ~stop
    xkm1=xk;
    for i=1:n
        delta=0;
        for j=1:n
            if j~=i
                delta=delta+A(i,j)*xk(j);
            end
        end
        xk(i)=(b(i)-delta)/A(i,i);
    end
    k=k+1;
    if norm(xk-xkm1)<=n*eps
        r=A*xk-b;
        if norm(r)<=n*eps
            stop=true;
        end
    end
    if toc(t0)>5
        stop=true;
    end
end


end

