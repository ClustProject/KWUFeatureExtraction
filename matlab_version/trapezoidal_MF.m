function u = trapezoidal_MF(k, z, nc)
% Trapezoidal Membership function
% if k==1 or k==c apply Trapezoidal Membership function
%
% Inputs:
% z: series which time series y mapped
% k: interger close to z
%
% Output:
% u: the degree of membership of z

if(k==1)
    if(z>2) 
        u = 0;
    elseif((z>=1) && (z<=2))
        u = 2-z;
    elseif(z<1)
        u = 1;
    end

elseif(k==nc)
    if(z>nc) 
        u = 1;
    elseif((z>=nc-1) && (z<=nc))
        u = z-nc+1;
    elseif(z<nc-1)
        u = 0;
    end

end
