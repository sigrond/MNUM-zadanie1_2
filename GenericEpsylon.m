EpsylonSingle=eps(single(1));
disp(sprintf('EpsylonSingle = %1.20e (2^%d)\n',EpsylonSingle,log2(EpsylonSingle)));
EpsylonDouble=eps;
disp(sprintf('EpsylonDouble = %1.20e (2^%d)\n',EpsylonDouble,log2(EpsylonDouble)));