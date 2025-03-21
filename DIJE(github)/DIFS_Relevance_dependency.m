function [dependency] = DIFS_Relevance_dependency(dataArray,labels,lammda)


[m,n]=size(dataArray); 
if m<4 || n<4 
    disp('输入的决策系统行列个数不得小于4个！');
    return;
end


dpd_all = getPosSet(dataArray,labels,lammda); 

for g=1:n 
      condiAtt_new=dataArray(:,g); 
    dataArray_new=condiAtt_new; 
    
    PosSet_Att=getPosSet(dataArray_new,labels,lammda); 
    dpd_Att_tmp=PosSet_Att; 
    dpd_Atti(g,1)=dpd_Att_tmp; 
end

dependency=[]; 

for i=1:length(dpd_Atti)  
       dependency=[dependency,dpd_Atti(i,1)];
end
