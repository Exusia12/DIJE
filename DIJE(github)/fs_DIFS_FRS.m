function select_feature=fs_DIFS_FRS(features,labels,neighbor)


[row,column]=size(features);
data=features;


Con_Attribute=column;
Select_Fea = [];
unSelect_Fea =linspace(1,Con_Attribute,Con_Attribute);
weight = ones(1,Con_Attribute);
sig = [];

ALLConAtt=1:Con_Attribute;
alpha=0.15;
global rd
rd=CSM(labels,alpha); 



Rel = DIFS_Relevance_dependency(features,labels,neighbor);



FE_d=entropy(rd); 
CF=zeros(length(ALLConAtt)); 
for i=1:length(ALLConAtt)-1
    r3=Matrix_Neighborhood(features(:,i),neighbor );
    FE_ak(i)=entropy(r3);
    FJE_ak_d(i)=entropy(min(r3,rd));                    
    for j=i+1:length(ALLConAtt)
        r4=Matrix_Neighborhood(features(:,j),neighbor );
        FE_ap(j)=entropy(r4);                       
        FJE_ap_d(j)=entropy(min(r4,rd));             
        FJE_ak_ap(i,j)=entropy(min(r3,r4));           
        FJE_ak_ap_d(i,j)=entropy(min(min(r3,r4),rd));
        CF(i,j)= ( FJE_ak_ap(i,j) + FJE_ak_d(i) + FJE_ap_d(j) - FE_ak(i) - FE_ap(j) ...
            - FE_d - FJE_ak_ap_d(i,j) ) /(FE_ak(i)+FE_ap(j)) + 1;
        CF(j,i)=CF(i,j);                            
    end
end
while ~isempty(unSelect_Fea)
    J_DIFS_IFS=[];
  
    for fi=1:length(unSelect_Fea)      
        J_DIFS_IFS(fi) = weight(unSelect_Fea(fi)) * Rel(unSelect_Fea(fi));
    end
   
    [max_sig,max_tem]=max(J_DIFS_IFS);      
    sig=[sig max_sig];                      
    Select_Fea=[Select_Fea unSelect_Fea(max_tem)];
    unSelect_Fea=setdiff(unSelect_Fea,unSelect_Fea(max_tem));
    for i=1:length(unSelect_Fea)                  
        for j=i+1:length(unSelect_Fea)            
            i_tem=unSelect_Fea(i);                
            j_tem=unSelect_Fea(j);
            weight(i_tem)=weight(i_tem)*CF(i_tem,j_tem);        
        end
    end
end

select_feature=Select_Fea;

    
    
    
