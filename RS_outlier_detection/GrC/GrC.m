%%% Detecting Granular Computing-based (GrC) algorithm
%%% Please refer to the following papers: 
%%% Outlier Detection Based on Granular Computing,2008
%%% Uploaded by Yuan Zhong on Sep. 11, 2022. E-mail:yuanzhong2799@foxmail.com.
function OOF=GrC(data)
%%%input:
% data is data matrix without decisions, where rows for samples and columns for attributes. 
%%%output
% Ranking objects and Object Outlier Factor(OOF),i.e.,outlier score

[n,m]=size(data); % n为样本数 m为属性个数(最后一列为决策属性)

%%
D_tem=zeros(n);
for l=1:m
RM_tem=pdist2(data(:,l),data(:,l))==0;
D_tem=D_tem+RM_tem;
end
NOM=m-D_tem;
%%
weight1=zeros(n,m);%单属性权重
 for l=1:m
eval(['Mgg' num2str(l) '=zeros(n);']);
RM_tem=pdist2(data(:,l),data(:,l))==0;
[RM_temp,~,ic]=unique(RM_tem,'rows');
for i=1:size(RM_temp,1)
    tempi=RM_temp(i,:)~=0;
    i_tem=ic==i;
   for j=1:size(RM_temp,1)
    tempj=RM_temp(j,:)~=0;
    j_tem=ic==j;
    tem=sum(sum(NOM(tempi,tempj)))/(sum(RM_temp(i,:))*sum(RM_temp(j,:)));
    eval(['Mgg' num2str(l) '(i_tem,j_tem)=tem;']);
   end
   weight1(i_tem,l)=1-sum(RM_temp(i,:))/n;
end
end  
%%
 NGOF=zeros(n,m);
 for k=1:m
     Mgg=eval(['Mgg' num2str(k)]);
     [Mgg_temp,ia,ic]=unique(Mgg,'rows');
 for i=1:size(Mgg_temp,1)
     i_tem=ic==i;
     NGOF(i_tem,k)=length(find(Mgg_temp(i,ia)>(m/2)))/size(Mgg_temp,1); 
 end 
 end
%%
OOF=zeros(n,1);
for j=1:n
   OOF(j)=sum(NGOF(j,:).*weight1(j,:))/m;
end
end
