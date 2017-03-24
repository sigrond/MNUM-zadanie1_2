function [ output_args ] = JacobiMethod_1_2_3( input_args )
%JacobiMethod_1_2_3 Summary of this function goes here
%   Detailed explanation goes here

A4=[15 3 -2 -8;
    3 -12 -1 9;
    7 3 35 18;
    1 1 1 5];
b4=[5; -2; 29; 10];


[X,ex]=JacobiMethod(A4,b4)


t0=tic;
n=5;
while toc(t0)<20
    n=n*2;
    n
    [ A1, b1 ] = EquationSystem1( n );
    [X,ex1]=JacobiMethod(A1,b1);
    ex1
    
    %uk³ad 2 dla metody Jacobiego jest niezbie¿ny. 
    [ A2, b2 ] = EquationSystem2( n );
    [X,ex2]=JacobiMethod(A2,b2);
    ex2
    
    [ A3, b3 ] = EquationSystem3( n );
    [X,ex3]=JacobiMethod(A3,b3);
    ex3
end


end

