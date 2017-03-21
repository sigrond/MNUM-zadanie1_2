function [ ] = GaussElimination_1_2_2()
%GaussElimination_1_2_2 Metoda eliminacji Gaussa z czêœciowym wyborem
%elementu podstawowego (g³ównego) - Gaussa-Crouta
%   rozwi¹zywanie 3  grup uk³adów równañ o ró¿nych rozmiarach


%rozwi¹zywanie uk³adów 1
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

    %uk³ad 1
    for k=1:n%zamieni³em oznaczenia indeksów, bo wolê mieæ i jako indeks pêtli g³ównej
        for j=1:n
            if k==j
                A1(k,j)=7;
            elseif k==j-1 || k==j+1
                A1(k,j)=1;
            else
                A1(k,j)=0;
            end
        end
        %b1(k)=1.4+0.6i;
        %po dok³adniejszym przeanalizowaniu zadañ doszed³em do wniosku, ¿e
        %tu jednak nie chodzi o jednostkê urojon¹, a o indeks i
        b1(k)=1.4+0.6*k;
    end

    [X1,eX1(i)]=GE(A1,b1);
    if eX1(i)>maxError
        maxError=eX1(i);
    end

    lastExecutionTime=toc(t1);
    timeAproximation=(lastExecutionTime/((n/2)^3))*n^3;

end

figure('Name','uk³ad 1');
plot(nVector(1:i),eX1(1:i));

%rozwi¹zywanie uk³adów 2
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

    A2=zeros(n,n);
    b2=zeros(n,1);

    %uk³ad 2
    for k=1:n
        for j=1:n
            if k==j
                A2(k,j)=1/5;
            else
                A2(k,j)=2*(k-j)+1;
            end
        end
        b2(k)=1+0.4*k;
    end

    [X2,eX2(i)]=GE(A2,b2);
    if eX2(i)>maxError
        maxError=eX2(i);
    end

    lastExecutionTime=toc(t1);
    timeAproximation=(lastExecutionTime/((n/2)^3))*n^3;

end

figure('Name','uk³ad 2');
plot(nVector(1:i),eX2(1:i));

%rozwi¹zywanie uk³adów 3
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

    A3=zeros(n,n);
    b3=zeros(n,1);

    %uk³ad 3
    for k=1:n%zamieni³em oznaczenia indeksów, bo wolê mieæ i jako indeks pêtli g³ównej
        for j=1:n
            A3(k,j)=7/(9*(k+j+1));
        end
        if mod(k,2)==0
            b3(k)=7/(5*k);
        else
            b3(k)=0;
        end
    end

    [X3,eX3(i)]=GE(A3,b3);
    if eX3(i)>maxError
        maxError=eX3(i);
    end

    lastExecutionTime=toc(t1);
    timeAproximation=(lastExecutionTime/((n/2)^3))*n^3;

end

figure('Name','uk³ad 3');
plot(nVector(1:i),eX3(1:i));

end


