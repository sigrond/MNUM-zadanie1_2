function [ A, b ] = EquationSystem2( n )
%EquationSystem2 zwraca uk³ad równañ 2
%   Detailed explanation goes here

A=zeros(n,n);
b=zeros(n,1);

%uk³ad 2
for i=1:n
    for j=1:n
        if i==j
            A(i,j)=1/5;
        else
            A(i,j)=2*(i-j)+1;
        end
    end
    b(i)=1+0.4*i;
end

end

