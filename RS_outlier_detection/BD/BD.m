%%% Detecting boundary and distance (BD)-based outliers algorithm
%%% Please refer to the following papers: 
%%% A hybrid approach to outlier detection based on boundary region,2011
%%% Uploaded by Yuan Zhong on Sep. 11, 2022. E-mail:yuanzhong2799@foxmail.com.
function HOF=BD(data,X_tem)
%%%input:
% data is data matrix without decisions, where rows for samples and columns for attributes. 
% X_tem is a subset given condition.
%%%output
% hybrid outlier factor,i.e.,outlier score

[n,m]=size(data);

X=zeros(1,n);
X(X_tem)=1;

D1=m/3; 
D2=m/2; 
D3=0.9*m;

Lower=zeros(m,n);
for j=1:m
rm_tem=pdist2(data(:,j),data(:,j))==0;
Lower_temp=min(max(1- rm_tem,repmat(X,n,1)),[],2);
Lower(j,1:length(Lower_temp))=Lower_temp;
end

IB=repmat(X,m,1)-Lower;
EB=min(IB,[],1);
PB=IB-repmat(EB,m,1);
PB(PB<0)=0;

n_X=sum(X);
weight=zeros(n_X,m);
for j=1:m
RM_tem=pdist2(data(:,j),data(:,j))==0;
weight_x=[];
for i=1:n_X
temp1=RM_tem(X_tem(i),:);
weight_temp=1-(sqrt((sum(min(temp1,X))))/n_X);
weight_x=[weight_x,weight_temp];
end
weight((1:length(weight_x)),j)=weight_x'; 
end

IB_tem=sum(IB,2);
[d,e]=sort(IB_tem,'descend');
weightA=repmat(sqrt(d')./m,n_X,1);

LowerA=zeros(m,n);
for j=1:m
AS=e(1:m-j+1);
rmA_tem=pdist2(data(:,AS),data(:,AS))==0;
LowerA_temp=min(max(1- rmA_tem,repmat(X,n,1)),[],2);
LowerA(j,1:length(LowerA_temp))=LowerA_temp;
end

IBA=repmat(X,m,1)-LowerA;
EBA=EB;
PBA=IBA-repmat(EBA,m,1);
PBA(PBA<0)=0;

D_tem=zeros(n);
for l=1:m
rm_tem=pdist2(data(:,l),data(:,l))==0;
D_tem=D_tem+rm_tem;
end
OM=m-D_tem;
X_OM=OM(X_tem,X_tem);

EB_num=zeros(n_X,m);
Lower_num=zeros(n_X,m);
PB_num=zeros(n_X,m);

EBA_num=zeros(n_X,m);
LowerA_num=zeros(n_X,m);
PBA_num=zeros(n_X,m);
for j=1:m
    temp2=Lower(j,:);
    temp3=PB(j,:);
    tempA2=LowerA(j,:);
    tempA3=PBA(j,:);
    for i=1:n_X
        temp1=X_OM(i,:);
        tempA1=X_OM(i,:);
        EB_num(i,j)=sum(min(EB(X_tem),temp1<=D1));
        PB_num(i,j)=sum(min(temp3(X_tem),temp1>=D2));
        Lower_num(i,j)=sum(min(temp2(X_tem),temp1>=D3));
        
        EBA_num(i,j)=sum(min(EBA(X_tem),tempA1<=D1));
        PBA_num(i,j)=sum(min(tempA3(X_tem),tempA1>=D2));
        LowerA_num(i,j)=sum(min(tempA2(X_tem),tempA1>=D3));
    end
end

%%
DF=zeros(n_X,m);
DFA=zeros(n_X,m);
for i=1:n_X
DF(i,:)=(EB_num(i,:)+Lower_num(i,:)+PB_num(i,:))/n_X;
DFA(i,:)=(EBA_num(i,:)+LowerA_num(i,:)+PBA_num(i,:))/n_X;
end
%%
HOF=zeros(n_X,1);%多重离群因子
for i=1:n_X
    HOF(i)=(sum(DF(i,:).*weight(i,:))+sum(DFA(i,:).*weightA(i,:)))/(2*m);
end
end
