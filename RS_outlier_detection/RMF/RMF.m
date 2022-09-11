%%% Detecting rough membership function-based outliers (RMF) algorithm
%%% Please refer to the following papers: 
%%% A rough set approach to outlier detection,2008
%%% Uploaded by Yuan Zhong on Sep. 11, 2022. E-mail:yuanzhong2799@foxmail.com.
function ROF=RMF(data,X)
%%%input:
% data is data matrix without decisions, where rows for samples and columns for attributes. 
% X is a subset given condition.
%%%output
% Ranking objects and Rough Outlier Factor(ROF),i.e.,outlier score
[n,m]=size(data); % nΪ������ mΪ���Ը���(���һ��Ϊ��������)

X_F=zeros(1,n);
X_F(X)=1;%תXΪģ����ʽ��ʾ

%%    
n_X=length(X);
mu_X=zeros(n_X,m);%ת��Ϊ�����ʾ����
weight=zeros(n_X,m);
for l=1:m
   r_temp=pdist2(data(:,l),data(:,l))==0;%ȡ��l��ģ����ϵ����
   for i=1:n_X
       mu_X(i,l)=sum(min(r_temp(X(i),:),X_F))/sum(r_temp(X(i),:));%����ģ���ֲ�������
       weight(i,l)=sqrt(sum(r_temp(X(i),:))/n);
   end
end
%%
mu_ASX=zeros(n_X,m-1);%ת��Ϊ�����ʾ����
weightAS=zeros(n_X,m-1);
for i=1:n_X
 [~,e]=sort(mu_X(i,:),'descend');%eΪԭ�������ascendΪ���� descend
 for l=1:m-1
     AS=e(1:m-1-l+1); %AS
     ssr_AS=pdist2(data(:,AS),data(:,AS))==0;
     ssr_tem=ssr_AS(X(i),:);
     a=sum(ssr_tem);
     mu_ASX(i,l)=sum(min(ssr_tem,X_F))/a;
     weightAS(i,l)=length(AS);
 end
end
%%
ROF=zeros(n_X,1);
for j=1:n_X
    temp=mu_X(j,:);
    tempAS=mu_ASX(j,:);
    ROF(j)=1-((sum(tempAS.*weightAS(j,:))+sum(temp.*weight(j,:)))/(2*(m-1)^2));
end
end
