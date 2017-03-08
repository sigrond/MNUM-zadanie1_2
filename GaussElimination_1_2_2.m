function [ X, eX ] = GaussElimination_1_2_2( n )
%GaussElimination_1_2_2 Metoda eliminacji Gaussa z czêœciowym wyborem
%elementu podstawowego (g³ównego) - Gaussa-Crouta
%   rozwi¹zywanie 3  grup uk³adów równañ o ró¿nych rozmiarach
if ~exist('n','var')
    n=10;
end

function [x, ex] = GE(A,b)
%funkca rozwi¹zuj¹ca zadany uk³ad równañ metod¹ Gaussa-Crouta
%na podstawie: http://we.pb.edu.pl/~jforenc/2006_2007_02/PIF2-2007-Wykl-05-Dzienne.pdf
%i: http://eduinf.waw.pl/inf/alg/001_search/0077.php
%x - rozwi¹zanie
%ex - b³¹d rozwi¹zania
AB=[A,b];
W=1:n+1;%numery kolumn
for i=1:n-1
    k=i;
    %wyszukujemy element o najwiêkszym module
    for j=i+1:n
        if abs(AB(W(k),i))<abs(AB(W(j),i))
            k=j;
        end
    end
    %w wektorze zamieniamy numery kolumn wg znalezionego elementu
    tmp=W(k);
    W(k)=W(i);
    W(i)=tmp;
    if abs(AB(W(i),i))<eps(0)
        
        return;
    end
    
        
%[a,ind]=max(abs(AB(:,i)));
%zamieniamy miejscami pierwszy wiersz z wierszem, w którym wystêpuje element o najwiêkszym module
tmp=AB(i,:);
AB(i,:)=AB(ind,:);
AB(ind,:)=tmp;
%redukcja

end



end

disp 'b'

end


