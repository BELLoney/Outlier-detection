%%% Detecting information entropy-based (IE) algorithm
%%% Please refer to the following papers: 
%%% An information entropy-based approach to outlier detection in rough sets,2010
%%% Uploaded by Yuan Zhong on Sep. 11, 2022. E-mail:yuanzhong2799@foxmail.com.
function EOF=IE(data)
%%%input:
% data is data matrix without decisions, where rows for samples and columns for attributes. 
% X_tem is a subset given condition.
%%%output
% Ranking objects and entropy outlier factor(EOF),i.e.,outlier score

[n,m]=size(data); 
  
E=zeros(1,m);
E_x=zeros(n,m);
RC_x=zeros(n,m);
weight=zeros(n,m);

for l=1:m
    RM=pdist2(data(:,l),data(:,l))==0;
    RM_tem=unique(RM,'rows');
    E_tem=0;
for r=1:size(RM_tem,1)
    nSetB_tem=sum(RM_tem(r,:))/n;
    E_tem=E_tem+(nSetB_tem)*log2(1/nSetB_tem);%plogp  
end
E(l)=E_tem;

t=1;
while (t<=n)
   RM_te=RM;
   t_len=sum(RM_te(t,:));
   tempt=RM_te(t,:);
   RM_te(tempt~=0,:)=[];
%    RM_te(ismember(RM_te,t))=0;
%    RM_te=sort(RM_te,2,'descend');
   RM_temp=unique(RM_te,'rows');
   E_xtem=0;
   for e=1:size(RM_temp,1)
    E_xtemp=sum(RM_temp(e,:))/(n-t_len);
    E_xtem=E_xtem+E_xtemp*log2(1/E_xtemp);
   end
  E_x(t,l)=E_xtem;
  RC_x(t,l)=t_len-sum(sum(RM_temp))/size(RM_temp,1);
  weight(t,l)=sqrt(sum(RM(t,:))/n);
  t=t+1;%下一个对象
end
end
RC_x(isnan(RC_x)) = n;
RE=1-E_x./repmat(E,n,1);%相对模糊熵
RE(RE<=0) = 0;
RE(isnan(RE)) = 0;
RE(RE>1) = 0;
%%
[d_de,e_de]=sort(E,'descend');%e为原来的序号ascend

%%
EA_de=zeros(1,m);
EA_de_x=zeros(n,m);
RCA_de_x=zeros(n,m);
weightA_de=zeros(n,m);

for l=1:m
    lA_de=e_de(1:m+1-l);
    RM_de=pdist2(data(:,lA_de),data(:,lA_de))==0;  
    RM_de_tem=unique(RM_de,'rows');%   
    EA_de_tem=0;
for r=1:size(RM_de_tem,1)
    nSetB_de_tem=sum(RM_de_tem(r,:))/n;
    EA_de_tem=EA_de_tem+(nSetB_de_tem)*log2(1/nSetB_de_tem);
end
EA_de(l)=EA_de_tem;

t=1;%初始化第一个对象
while (t<=n)
   RMA_de_te=RM_de;%把邻域类赋值给矩阵NbrSetA_te
   tA_len=sum(RMA_de_te(t,:));
   tempt_de_A=RMA_de_te(t,:);
   RMA_de_te(tempt_de_A~=0,:)=[];%删除对象t所在的邻域 
   RM_de_temp=unique(RMA_de_te,'rows');%获取不重复的邻域类
   EA_de_xtem=0;%初始化
   for e=1:size(RM_de_temp,1)%求不同邻域类的个数
    EA_de_xtemp=sum(RM_de_temp(e,:))/(n-tA_len);%求某个邻域类占比例
    EA_de_xtem=EA_de_xtem+(EA_de_xtemp)*log2(1/EA_de_xtemp);%(plogp)
   end  
   EA_de_x(t,l)=EA_de_xtem;%将信息熵存放HA_xl矩阵的第t列
   RCA_de_x(t,l)=tA_len-sum(sum(RM_de_temp))/size(RM_de_temp,1);%求对象t的相对邻域势
   weightA_de(t,l)=sqrt(sum(RM_de(t,:))/n); 
   t=t+1;%下一个对象
end
end
RCA_de_x(isnan(RCA_de_x)) = n;
RE_deA=1-EA_de_x./repmat(EA_de,n,1);%相对熵
RE_deA(RE_deA<=0) = 0;
RE_deA(isnan(RE_deA)) = 0;
RE_deA(RE_deA>1) = 0;
%%
OD_Xl=zeros(n,m);%离群程度
ODAde_Xl=zeros(n,m);%离群程度
for r=1:n
 OD_temp=RE(r,:);
 ODAde_temp=RE_deA(r,:);
for s=1:m
        if RC_x(r,s)>0
          OD_Xl(r,s)=OD_temp(s)*((n-abs(RC_x(r,s)))/(2*n));  
        else 
          OD_Xl(r,s)=OD_temp(s)*sqrt(((n+abs(RC_x(r,s)))/(2*n)));  
        end
        if RCA_de_x(r,s)>0
          ODAde_Xl(r,s)=ODAde_temp(s)*((n-abs(RCA_de_x(r,s)))/(2*n)); 
        else 
          ODAde_Xl(r,s)=ODAde_temp(s)*sqrt(((n+abs(RCA_de_x(r,s)))/(2*n)));
        end
end
end
%%
EOF=zeros(n,1);
for j=1:n
    temp3=ODAde_Xl(j,:);
    temp1=OD_Xl(j,:);
    EOF(j)=1-((sum((1-temp1).*weight(j,:))+sum((1-temp3).*weightA_de(j,:)))/(2*m));
end
end
