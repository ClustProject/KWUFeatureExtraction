%% Extract Features using various entropy methods

scale = 25;

% Set parameters for entropy functions
m=3; % Embedded dimension 
c=6; % Num of class
tau = 1; % Delay
dim =3; % Embedded Dim of Permutation Entropy

% CHF
for i=1:size(RRIs_CHF,1)
    
    %Dispersion Entropy
    mdeCHF(i,:) = MDE(RRIs_CHF(i,1:pts),m,c,tau,scale);
    %Cumulative Residual Dispersion Entropy
    mcrdeCHF(i,:) = MCRDE(RRIs_CHF(i,1:pts),m,c,tau,scale);
    %Sample Entropy
    mseCHF(i,:) = MSE_mu(RRIs_CHF(i,1:pts),2, 0.015,tau,scale);
    %Permutation Entropy
    for sc = 1:scale
        scaledDt = multiScale(RRIs_CHF(i,1:pts), sc);
       mpeCHF(i,sc) = pe(scaledDt, dim, tau); 
    end
end

avg_mde_chf = mean(mdeCHF,1);        err_mde_chf = std(mdeCHF,0,1);
avg_mcrde_chf = mean(mcrdeCHF,1);    err_mcrde_chf = std(mcrdeCHF,0,1);
avg_mse_chf = mean(mseCHF,1);        err_mse_chf = std(mseCHF,0,1);
avg_mpe_chf = mean(mpeCHF,1);        err_mpe_chf = std(mpeCHF,0,1);

% AF
for i=1:size(RRIs_AF,1)
    %Dispersion Entropy
    mdeAF(i,:) = MDE(RRIs_AF(i,1:pts),m,c,tau,scale);
    %Cumulative Residual Dispersion Entropy
    mcrdeAF(i,:) = MCRDE(RRIs_AF(i,1:pts),m,c,tau,scale);
    %Sample Entropy
    mseAF(i,:) = MSE_mu(RRIs_AF(i,1:pts),2, 0.015,tau,scale);
    %Permutation Entropy
    for sc = 1:scale
       scaledDt = multiScale(RRIs_AF(i,1:pts), sc);
       mpeAF(i,sc) = pe(scaledDt, dim, tau); 
    end  
end

avg_mde_af = mean(mdeAF,1);         err_mde_af = std(mdeAF,0,1);
avg_mcrde_af = mean(mcrdeAF,1);     err_mcrde_af = std(mcrdeAF,0,1);
avg_mse_af = mean(mseAF,1);         err_mse_af = std(mseAF,0,1);
avg_mpe_af = mean(mpeAF,1);         err_mpe_af = std(mpeAF,0,1);

% HEALTHY
for i=1:size(RRIs_HEALTHY,1)
    %Diseprsion Entropy
    mdeHEALTHY(i,:) = (MDE(RRIs_HEALTHY(i,1:pts),m,c,tau,scale));
    %Cumulative Residual Diseprsion Entropy
    mcrdeHEALTHY(i,:) = (MCRDE(RRIs_HEALTHY(i,1:pts),m,c,tau,scale));
    %Sample Entropy
    mseHEALTHY(i,:) = MSE_mu(RRIs_HEALTHY(i,1:pts),2, 0.015,tau,scale);
    %Permutation Entropy
    for sc = 1:scale
       scaledDt = multiScale(RRIs_HEALTHY(i,1:pts), sc);
       mpeHEALTHY(i,sc) = pe(scaledDt, dim, tau); 
    end  
end

avg_mde_healthy = mean(mdeHEALTHY,1);       err_mde_healthy = std(mdeHEALTHY,0,1);
avg_mcrde_healthy = mean(mcrdeHEALTHY,1);   err_mcrde_healthy = std(mcrdeHEALTHY,0,1);
avg_mse_healthy = mean(mseHEALTHY,1);       err_mse_healthy = std(mseHEALTHY,0,1);
avg_mpe_healthy = mean(mpeHEALTHY,1);       err_mpe_healthy = std(mpeHEALTHY,0,1);
