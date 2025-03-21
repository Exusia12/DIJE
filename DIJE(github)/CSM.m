
function [ D ] = CSM( labels,alpha)
 F=labels;
 [N,L]=size(F);
 D=zeros(N,N);
 Dm=mean(F);
 for i=1:L
 [S]=Similarity(F(:,i));
 D=Dm(i).*S+D;
 end
 b=1-alpha;

 
 
 
 

