function PosSet = getPosSet(dataArray,labels,parm)

global rd
[m,n]=size(dataArray); 

for j=1:n
    amin=min(dataArray(:,j));
    amax=max(dataArray(:,j));
    for i=1:m
        dataArray(i,j)=(dataArray(i,j)-amin)./(amax-amin);
    end
end

MC= rd;
MN = Matrix_Neighborhood( dataArray,parm );

tmp = min( MC,MN );
K=0;
for i=1:m
    Si=sum(tmp(i,:))/m;
    K=K+Si;
    Si=0;
end

PosSet =K/m;
end









