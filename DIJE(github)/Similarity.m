    function [S]=Similarity(label)

data=label;
[max_data,~]=max(data);
[min_data,~]=min(data);
A=max_data-min_data;        
distance = pdist2(data,data);
S=1-distance./A;          

