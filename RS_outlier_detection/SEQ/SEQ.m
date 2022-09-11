%%%% Detecting Sequence-based (SEQ) algorithm
%%% Please refer to the following papers: 
%%% Some issues about outlier detection in rough set theory,2009
%%% Uploaded by Yuan Zhong on Sep. 11, 2022. E-mail:yuanzhong2799@foxmail.com.
function SOF=SEQ(data)
%%%input:
% data is data matrix without decisions, where rows for samples and columns for attributes. 
%%%output
% Ranking objects and sequence outlier factor (SOF),i.e.,outlier score
[n,m]=size(data); % n为样本数 m为属性个数(最后一列为决策属性)

weight=zeros(n,m);
Var=zeros(1,m);
for l=1:m
RM=pdist2(data(:,l),data(:,l))==0;
NbrSet_tem=unique(RM,'rows');
Var_temp=sum(NbrSet_tem,2);
Var(l)=sum((Var_temp-mean(Var_temp)).^2)/size(NbrSet_tem,1);
weight(1:n,l)=sum(RM,2)./n;
end
%%
[~,e_as]=sort(Var,'descend');%e为原来的序号ascend升序

weightA_as=zeros(n,m);
for j=1:m
      lA_as=e_as(j:end);
      RM_asA=pdist2(data(:,lA_as),data(:,lA_as))==0;
      weightA_as(1:n,j)=sum(RM_asA,2);
end
%%
ES=zeros(n,m-1);
for j=2:m
    ES_temp=abs(weightA_as(:,j)-weightA_as(:,j-1))./n;
    ES((1:length(ES_temp)),j-1)=ES_temp;
end
%%
SOF=zeros(n,1);
for j=1:n
    SOF(j)=sum(1-ES(j,:))*(sum(1-weight(j,:))/m);
end
end
