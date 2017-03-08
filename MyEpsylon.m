%Kody wyliczaj¹ce epsilon maszynowy
%na podstawie: https://en.wikipedia.org/wiki/Machine_epsilon
disp(sprintf('Aproksymacja Epsilonu Maszynowego:\n'));
%Aproksymacja epsilonu maszynowego dla pojedyñczej precyzji
dx=single(1.0);
while dx+single(1.0)>single(1.0)
    dx=dx*single(0.5);
end
MyEpsSingle=dx*single(2.0);%uzgodnienie z drug¹ definicj¹ epsilona maszynowego
disp(sprintf('EpsylonSingle = %1.20e (2^%d)\n',MyEpsSingle,log2(MyEpsSingle)));

%Aproksymacja epsilonu maszynowego dla podwójnej precyzji
%normalnie domyœlnym typem jest double
dx=1;
while dx+1.0>1.0
    dx=dx*0.5;
end
MyEpsDouble=dx*2.0;
disp(sprintf('EpsylonDouble = %1.20e (2^%d)\n',MyEpsDouble,log2(MyEpsDouble)));

%Wyliczenie epsilona maszynowego przez ró¿nicê kolejnych wartoœci
%reprezentacji zmiennoprzecinkowej w standardzie IEE754
disp(sprintf('Uzyskanie Epsilona Maszynowego przez rzutowanie typów:\n'));
%Epsilon dla single
a=single(1);
b=typecast(a,'int32');
b=b+int32(1);
c=typecast(b,'single');
MyEps2=c-a;
disp(sprintf('EpsylonDouble = %1.20e (2^%d)\n',MyEps2,log2(MyEps2)));
%Epsilon dla double
a=1;
b=typecast(a,'int64');
b=b+int64(1);
c=typecast(b,'double');
MyEps2=c-a;
disp(sprintf('EpsylonSingle = %1.20e (2^%d)\n',MyEps2,log2(MyEps2)));


