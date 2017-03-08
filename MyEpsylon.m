
dx=single(1.0);
while dx+single(1.0)>single(1.0)
    dx=dx*single(0.5);
end
MyEpsSingle=dx*single(2.0);
disp(sprintf('EpsylonSingle = %1.20e (2^%d)\n',MyEpsSingle,log2(MyEpsSingle)));

%przedeklarowujê typ na double bo poprzednie zmienne s¹ single, normalnie
%domyœlny jest double
dx=double(1.0);
while dx+1.0>1.0
    dx=dx*0.5;
end
MyEpsDouble=dx*2.0;
disp(sprintf('EpsylonDouble = %1.20e (2^%d)\n',MyEpsDouble,log2(MyEpsDouble)));