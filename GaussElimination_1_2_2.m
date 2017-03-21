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

    A1=zeros(n,n);
    b1=zeros(n,1);

    %uk�ad 1
    for k=1:n%zamieni�em oznaczenia indeks�w, bo wol� mie� i jako indeks p�tli g��wnej
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
        %po dok�adniejszym przeanalizowaniu zada� doszed�em do wniosku, �e
        %tu jednak nie chodzi o jednostk� urojon�, a o indeks i
        b1(k)=1.4+0.6*k;
    end

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

    A2=zeros(n,n);
    b2=zeros(n,1);

    %uk�ad 2
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

    A3=zeros(n,n);
    b3=zeros(n,1);

    %uk�ad 3
    for k=1:n%zamieni�em oznaczenia indeks�w, bo wol� mie� i jako indeks p�tli g��wnej
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

figure('Name','uk�ad 3');
plot(nVector(1:i),eX3(1:i));

end


