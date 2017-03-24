function [ A, b ] = EquationSystem3( n )
%EquationSystem2 zwraca uk³ad równañ 3
%   Detailed explanation goes here

A=zeros(n,n);
b=zeros(n,1);

%uk³ad 3
for i=1:n
    for j=1:n
        A(i,j)=7/(9*(i+j+1));
    end
    if mod(i,2)==0
        b(i)=7/(5*i);
    else
        b(i)=0;
    end
end

end

