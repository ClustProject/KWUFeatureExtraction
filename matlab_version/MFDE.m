function [Out_MFDE Out_pdf] =MFDE(x,m,c,tau,Scale)
%
% This function calculates the multiscale fuzzy dispersion entropy (MFDE) of a univariate signal x
%
% Inputs:
%
% x: univariate signal - a vector of size 1 x N (the number of sample points)
% m: embedding dimension
% c: number of classes (it is usually equal to a number between 3 and 9 - we used c=6 in our studies)
% tau: time lag (it is usually equal to 1)
% Scale: number of scale factors
%
%Outputs:
%
% Out_MFDE: a vector of size 1 * Scale - the MFDE of x

Out_MFDE=NaN*ones(1,Scale);
Out_MFDE(1)=FuzzyDisEn_NCDF(x,m,c,tau,0);

sigma=std(x);
mu=mean(x);

for j=2:Scale
    xs = Multi(x,j);
    Out_MFDE(j) =FuzzyDisEn_NCDF_ms(xs,m,c,mu,sigma,tau,0);
end


function M_Data = Multi(Data,S)
%  generate the consecutive coarse-grained time series
%  Input:   Data: time series;
%           S: the scale factor
% Output:
%           M_Data: the coarse-grained time series at the scale factor S

L = length(Data);
J = fix(L/S);

for i=1:J
    M_Data(i) = mean(Data((i-1)*S+1:i*S));
end