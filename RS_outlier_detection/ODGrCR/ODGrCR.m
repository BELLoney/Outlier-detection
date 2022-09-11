%%% Detecting outlier detection based on granular computing and rough sets (ODGrCR) algorithm
%%% Please refer to the following papers: 
%%% Outlier detection based on granular computing and rough set theory,2015
%%% Uploaded by Yuan Zhong on Sep. 11, 2022. E-mail:yuanzhong2799@foxmail.com.
function GROF=ODGrCR(data)
%%%input:
% data is data matrix without decisions, where rows for samples and columns for attributes. 
% X_tem is a subset given condition.
%%%output
% Ranking objects and GrC and rough sets-based outlier factor(GROF),i.e.,outlier score

[n,m]=size(data); % n为样本数 m为属性个数(最后一列为决策属性)

LA=1:m; %属性集合序号
weight1=zeros(n,m);%单属性权重
weight3=zeros(n,m);%单属性权重

%%
for l=1:m
lA_d=setdiff(LA,l);
eval(['Acc_A_a' num2str(l) '=zeros(n,m);'])%去掉一个属性之后的近似精度
RM_tem=pdist2(data(:,l),data(:,l))==0;
[RM_temp,~,ic]=unique(RM_tem,'rows');
for i=1:size(RM_temp,1)
    i_tem=find(ic==i);
for k=0:m-2 
if k==0
 lA_de=lA_d;
else 
lA_de=setdiff(lA_d,lA_d(k));
end

RM_tmp=pdist2(data(:,lA_de),data(:,lA_de))==0;
Low_A=sum(min(max(1- RM_tmp,repmat(RM_temp(i,:),n,1)),[],2));
Upp_A=sum(max(min(RM_tmp,repmat(RM_temp(i,:),n,1)),[],2));
eval(['Acc_A_a' num2str(l) '(i_tem,k+1)=Low_A/Upp_A;'])
end
  weight3(i_tem,l)=1-(sum(RM_temp(i,:))/n)^(1/3); 
  weight1(i_tem,l)=(sum(RM_temp(i,:))/n);
end
end
%%
 FSDOG=zeros(n,m);
for i=1:n
 for k=1:m
     Acc_A_a=eval(['Acc_A_a' num2str(k)]);
     FSDOG(i,k)=1-((sum((Acc_A_a(i,2:m)+1)./2)+Acc_A_a(i,1))/m)*weight1(i,k);  
  end 
end
%%
GROF=zeros(n,1);
for j=1:n
   GROF(j)=sum(FSDOG(j,:).*weight3(j,:))/m;
end
end