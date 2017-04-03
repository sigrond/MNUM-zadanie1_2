function [X, ex] = GE(A,b)
%funkca rozwi¹zuj¹ca zadany uk³ad równañ metod¹ Gaussa-Crouta
%na podstawie: http://we.pb.edu.pl/~jforenc/2006_2007_02/PIF2-2007-Wykl-05-Dzienne.pdf
%i: http://eduinf.waw.pl/inf/alg/001_search/0077.php
%X - rozwi¹zanie
%ex - b³¹d rozwi¹zania
AB=[A,-b];
n=size(A,1);
W=1:n;%numery kolumn
for i=1:n-1
    k=i;
    %wyszukujemy element o najwiêkszym module
    for j=i+1:n
        if abs(AB(W(k),i))<abs(AB(W(j),i))%to chyba da siê zrobiæ w jednej operacji
            k=j;
        end
    end
    %w wektorze zamieniamy numery kolumn wg znalezionego elementu
    tmp=W(k);
    W(k)=W(i);
    W(i)=tmp;
    if abs(AB(W(i),i))<eps(0)%jeœli znaleziony element jest zerem, koñczymy
        %error('wybrany element jest zerem');
        ex=Inf;
        %return;
        break;
    end
    for j=i+1:n
        m=-AB(W(j),i)/AB(W(i),i);%wyznaczamy mno¿nik
        for kk=i:n+1 %sumujemy wiersz j-ty z wierszem i-tym przemno¿onym przez m
            AB(W(j),kk)=AB(W(j),kk)+m*AB(W(i),kk);%to chyba da siê zrobiæ w jednej operacji
        end
    end
    %AB(:,W(:))
end
% wyliczamy kolejne niewiadome
for i=n:-1:1
    if abs(AB(W(i),i))<eps(0)
        %error('dzielnik zero\n')
        ex=Inf;
        %return;
        break;
    end
    s=AB(i,n+1);
    for j=n:-1:i+1
        s=s-AB(W(j),i)*X(W(j));
    end
    X(W(i))=-s/AB(W(i),i);
end
%ex=n^3*2^(n-1)*eps;
r=A*X'-b;
ex=norm(r);



end