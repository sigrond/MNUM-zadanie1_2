function [ xk, ex ] = JacobiMethod( A, b )
%JacobiMethod implementacja metody Jacobiego
%   Rozwi�zywanie ukadw r�wna� liniowych
n=size(A,1);
xk=zeros(n,1);
k=0;
stop=false;
t0=tic;
M=diag(diag(A));
Z=tril(A,-1)+triu(A,1);
P=M^-1*Z;
p=norm(P,Inf)%promie� zbie�no�ci
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
        if isnan(xk(i)) || isinf(xk(i))%w tym przypadku nie ma co dalej liczy�
            stop=true;
            xk=xkm1;
            break;
        end
    end
    k=k+1;
    if norm(xk-xkm1)<=1e-12%bardzo ma�a poprawa
        r=A*xk-b;
        if norm(r)<=1e-12%wynik wystarczaj�co dok�adny
            stop=true;
        end
    end
    if toc(t0)>5
        stop=true
    end
end
r=A*xk-b;
ex=norm(r);
end

