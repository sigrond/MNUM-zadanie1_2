function [ output_args ] = JacobiMethod_1_2_3( input_args )
%JacobiMethod_1_2_3 Summary of this function goes here
%   Detailed explanation goes here

A4=[15 3 -2 -8;
    3 -12 -1 9;
    7 3 35 18;
    1 1 1 5];
b4=[5; -2; 29; 10];

X=JacobiMethod(A4,b4)

end

