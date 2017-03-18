function [ X, eX ] = GaussElimination_1_2_2()
%GaussElimination_1_2_2 Metoda eliminacji Gaussa z cz�ciowym wyborem
%elementu podstawowego (g��wnego) - Gaussa-Crouta
%   rozwi�zywanie 3  grup uk�ad�w r�wna� o r�nych rozmiarach



t0=tic;
t1=tic;
maxError=0;
i=0;
n=5;
timeAproximation=0;

while toc(t0)<5 && timeAproximation<10 && maxError<Inf
t1=tic;
i=i+1;
n=n*2;
nVector(i)=n;

A1=zeros(n,n);
b1=zeros(n,1);

for k=1:n
    for j=1:n
        if k==j
            A1(j,k)=7;
        elseif k==j-1 || k==j+1
            A1(j,k)=1;
        else
            A1(j,k)=0;
        end
    end
    b1(k)=1.4+0.6i;
end

[X,eX(i)]=GE(A1,b1);
if eX(i)>maxError
    maxError=eX(i);
end

lastExecutionTime=toc(t1);
timeAproximation=lastExecutionTime^3;

end

figure('Name','uk�ad 1');
plot(nVector(1:i),eX(1:i));

end


