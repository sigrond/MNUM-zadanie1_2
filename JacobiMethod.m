function [ output_args ] = JacobiMethod( A, b )
%JacobiMethod implementacja metody Jacobiego
%   Rozwi¹zywanie ukadw rwnañ liniowych
n=size(A);
xk=zeros(n,1);
k=0;
stop=false;
while ~stop
    xkm1=xk;
    for i=1:n
        delta=0;
        for j=1:n
            if j~=i
                delta=delta+a(i,j)*xk(j);
            end
        end
        xk(i)=(b(i)-delta)/A(i,i);
    end
    k=k+1;
    if norm(xk-xkm1)<=n*eps
        r=A*X'-b;
        if norm(r)<=eps
            stop=true;
        end
    end
end


end

