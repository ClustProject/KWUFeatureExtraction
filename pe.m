function Out_PE = pe(x,m,t)
%Out_PE = pe(x,m,t)
% Calculate the permutation entropy (PE)
% Input:    X: time series;
%           m: order of permuation entropy
%           t: delay time of permuation entropy,
% Output:
%           Out_PE:  Permutation Entropy
%
%Ref: 1)C. Bandt, and B. Pompe. "Permutation entropy: a natural complexity measure for time series." Physical review letters 88.17 (2002).
% 2) H. Azami and J. Escudero, “Improved Multiscale Permutation Entropy for Biomedical Signal Analysis: Interpretation and Application to Electroencephalogram Signals”,  Biomedical Signal Processing and Control , 2015.     %
%
%
%   Hamed Azami and Javier Escudero Rodriguez
%   hamed.azami@ed.ac.uk and javier.escudero@ed.ac.uk
%
%   23-June-15
%

PE_Temp = perms(1:m);
a(1:length(PE_Temp))=0;

for j=1:(length(x)-t*(m-1))
    [~,iv]=sort(x(j:t:j+t*(m-1)));
    for jj=1:length(PE_Temp)
        if (abs(PE_Temp(jj,:)-iv(:)'))==0
            a(jj) = a(jj) + 1 ;
        end
    end
end

% Computation of entropy based on the histogram of the motifs
a=a(a~=0);
p = a/sum(a);
Out_PE = -sum(p .* log(p));
