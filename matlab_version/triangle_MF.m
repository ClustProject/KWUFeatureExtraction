function u = triangle_MF(k, z)
% Triangle Membership function
% if not k==1 and k==c apply Trapezoidal Membership function
%
% Inputs:
% z: series which time series y mapped
% k: interger close to z
%
% Output:
% u: the degree of membership of z

if(z>k+1) 
    u = 0;
elseif((z>=k) && (z<=k+1))
    u = k+1-z;
elseif((z>=k-1) && (z<=k))
    u = z-k+1;
elseif(z<k-1)
    u = 0;
end
