function [ MN ] = Matrix_Neighborhood( feature,parm )

distance = pdist2( feature,feature );

MN = 1-distance;
MN(MN<1-parm)=0;
end
