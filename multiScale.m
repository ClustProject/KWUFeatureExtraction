function scaledDt = multiScale(Data, s)
%MULTISCALE 이 함수의 요약 설명 위치
%   자세한 설명 위치

L = length(Data);
J = fix(L/s);

for i= 1:J
    scaledDt(1,i) = mean(Data((i-1)*s+1:i*s));
end

end

