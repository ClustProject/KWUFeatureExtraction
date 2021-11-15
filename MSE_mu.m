function Out_MSE = MSE_mu(x,m,r,tau,Scale)
%
%  This function calculates the multiscale sample entropy (MSE) whose coarse-graining uses mean (MSE_mu)
%
%
% Inputs:
%
% x: univariate signal - a vector of size 1 x N (the number of sample points)
% m: embedding dimension
% r: threshold (it is usually equal to 0.15 of the standard deviation of a signal - because we normalize signals to have a standard deviation of 1, here, r is usually equal to 0.15)
% tau: time lag (it is usually equal to 1)
% Scale: the number of scale factors
%
%
% Outputs:
%
% Out_MSE: a vector showing the MSE_mu of x
%
% Ref:
% [1] H. Azami and J. Escudero, "Refined Multiscale Fuzzy Entropy based on Standard Deviation for Biomedical Signal Analysis", Medical & Biological Engineering &
% Computing, 2016.
% [2] M. Costa, A. Goldberger, and C.K. Peng, "Multiscale Entropy Analysis of Complex Physiologic Time Series", Physical review letters, vol. 89, no. 6, p. 068102, 2002.
%
%
% If you use the code, please make sure that you cite references [1] and [2].
%
% Hamed Azami and Javier Escudero Rodriguez
% hamed.azami@ed.ac.uk and javier.escudero@ed.ac.uk
%
%  7-September-16
%%

% Signal is centered and normalised to standard deviation 1
% x = x-mean(x);
% x = x./std(x);

Out_MSE=NaN*ones(1,Scale);

Out_MSE(1)=SampEn(x,m,r,tau);

for j=2:Scale
    xs = Multi_mu(x,j);
    Out_MSE(j)=SampEn(xs,m,r,tau);
end


function M_Data = Multi_mu(Data,S)

%  the coarse-graining process based on mean
%  Input:   Data: time series;
%           S: the scale factor

% Output:
%           M_Data: the coarse-grained time series at the scale factor S

L = length(Data);
J = fix(L/S);

for i=1:J
    M_Data(i) = mean(Data((i-1)*S+1:i*S));
end
