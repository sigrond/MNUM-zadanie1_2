function [ A, b ] = EquationSystem1( n )
%EquationSystem1 zwraca uk�ad r�wna� 1
%   Detailed explanation goes here

A=zeros(n,n);
b=zeros(n,1);

for i=1:n
    for j=1:n
        if i==j
            A(i,j)=7;
        elseif i==j-1 || i==j+1
            A(i,j)=1;
        else
            A(i,j)=0;
        end
    end
    %b1(i)=1.4+0.6i;
    %po dok�adniejszym przeanalizowaniu zada� doszed�em do wniosku, �e
    %tu jednak nie chodzi o jednostk� urojon�, a o indeks i
    b(i)=1.4+0.6*i;
end

end

