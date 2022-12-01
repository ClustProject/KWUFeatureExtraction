function [Out_FuzzyDisEn, npdf]=FuzzyDisEn_NCDF(x,m,nc,tau,type)
%
% This function calculates Fuzzy dispersion entropy (FuzzyDisEn) of a univariate
% signal x, using normal cumulative distribution function (NCDF)
%
% Inputs:
%
% x: univariate signal - a vector of size 1 x N (the number of sample points)
% m: embedding dimension
% nc: number of classes (it is usually equal to a number between 3 and 9 - we used c=6 in our studies)
% tau: time lag (it is usually equal to 1)
% type : select MFDE or MCRFDE (MFDE : 0, MCRFDE : 1)
%
% Outputs:
%
% Out_FuzzyDisEn: scalar quantity - the FuzzyDisEn of x
% npdf: a vector of length nc^m, showing the normalized number of disersion patterns of x


N=length(x);
sigma=std(x);
mu=mean(x);

y=normcdf(x,mu,sigma);

for i_N=1:N
    if y(i_N)==1
        y(i_N)=1-(1e-10);
    end
    
     if y(i_N)==0
        y(i_N)=(1e-10);
     end
end

z = y*nc+0.5;

for k=1:nc
    if(k==1 || k==nc)
        for r=1:N
            u_M(k,r) = trapezoidal_MF(k, z(r), nc);
        end
    else
        for r=1:N
            u_M(k,r) = triangle_MF(k, z(r));
        end
    end
end

v=nan*ones(nc^m,m);
u=1;
for k=1:m
    a = repmat(1:nc,nc^(k-1),1);
    temp_a = reshape(a,[],1);
    v(:,m-k+1) = repmat(temp_a,nc^(m-k),1);
end

u_pi = ones(nc^m,N-(m-1)*tau);
for s=1:nc^m
    for j=1:N-(m-1)*tau
        for i=1:m
            u_pi(s,j) = u_pi(s,j) * u_M(v(s,i),j+(i-1)*tau);
        end
    end
end

u_pi_sum = zeros(1,nc^m);
for s=1:nc^m
    u_pi_sum(s) = sum(u_pi(s,:));
end

npdf = u_pi_sum / (N-(m-1)*tau);


switch sign(type)
    case 0
        p=npdf(npdf~=0);
        Out_FuzzyDisEn = -sum(p .* log(p));
    case 1
        cmf = cumulativeFunc(npdf);
        rsd_cmf = zeros(1,length(cmf));
        rsd_cmf = 1-cmf(1:end);
        rsd = rsd_cmf(rsd_cmf ~= 0);
        % save npdf;   
        Out_FuzzyDisEn = -sum(rsd .* log(rsd));
        %Out_DisEn
    otherwise
        fprint('ERROR : Used undefined type')
end




