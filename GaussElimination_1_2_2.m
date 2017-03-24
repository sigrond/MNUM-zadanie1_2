function [ ] = GaussElimination_1_2_2()
%GaussElimination_1_2_2 Metoda eliminacji Gaussa z cz�ciowym wyborem
%elementu podstawowego (g��wnego) - Gaussa-Crouta
%   rozwi�zywanie 3  grup uk�ad�w r�wna� o r�nych rozmiarach


%rozwi�zywanie uk�ad�w 1
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

    [ A1, b1 ] = EquationSystem1( n );

    [X1,eX1(i)]=GE(A1,b1);
    if eX1(i)>maxError
        maxError=eX1(i);
    end

    lastExecutionTime=toc(t1);
    timeAproximation=(lastExecutionTime/((n/2)^3))*n^3;

end

figure('Name','uk�ad 1');
plot(nVector(1:i),eX1(1:i));

%rozwi�zywanie uk�ad�w 2
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

    [ A2, b2 ] = EquationSystem2( n );

    [X2,eX2(i)]=GE(A2,b2);
    if eX2(i)>maxError
        maxError=eX2(i);
    end

    lastExecutionTime=toc(t1);
    timeAproximation=(lastExecutionTime/((n/2)^3))*n^3;

end

figure('Name','uk�ad 2');
plot(nVector(1:i),eX2(1:i));

%rozwi�zywanie uk�ad�w 3
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

   [ A3, b3 ] = EquationSystem3( n );

    [X3,eX3(i)]=GE(A3,b3);
    if eX3(i)>maxError
        maxError=eX3(i);
    end

    lastExecutionTime=toc(t1);
    timeAproximation=(lastExecutionTime/((n/2)^3))*n^3;

end

figure('Name','uk�ad 3');
plot(nVector(1:i),eX3(1:i));

end


