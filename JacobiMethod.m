function [ xk, ex ] = JacobiMethod( A, b )
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
        if isnan(xk(i)) || isinf(xk(i))%w tym przypadku nie ma co dalej liczyæ
            stop=true;
            xk=xkm1;
            break;
        end
    end
    k=k+1;
    if norm(xk-xkm1)<=n*eps%bardzo ma³a poprawa
        r=A*xk-b;
        if norm(r)<=n*eps%wynik wystarczaj¹co dok³adny
            stop=true;
        end
    end
    if toc(t0)>5
        stop=true;
    end
end

r=A*xk-b;
ex=norm(r);

end

