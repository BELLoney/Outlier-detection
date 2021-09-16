%%Detecting Fuzzy Information Entropy-based Outlier Detection (FIEOD) algorithm
%%Please refer to the following papers: 
%%Yuan Zhong, Chen Hongmei, Li Tianrui, Liu Jia, ShuWang. 
%%Fuzzy information entropy-based adaptive approach for hybrid feature
%%outlier detection,Fuzzy Sets and Systems,2021.
%%Uploaded by Yuan Zhong on Sep. 6, 2021. E-mail:yuanzhong2799@foxmail.com.
function FEOF=FIEOD(data,delta)
%%%input:
% data is data matrix without decisions, where rows for samples and columns for attributes. 
% delta is used to adjust the adaptive fuzzy radius.
%%%output
% Ranking objects and fuzzy entropy outlier factor (FEOF).

[n,m]=size(data);

FE=zeros(1,m);
FE_x=zeros(n,m);
FRC_x=zeros(n,m);
weight=zeros(n,m);

Epsilon=zeros(1,m); 
for j=1:m
    if min(data(:,j))==0&&max(data(:,j))==1
     Epsilon(j)=std(data(:,j),1)/delta; 
    end
end
%%%%%%%%%%%%%compute fuzzy relation matrices with a single attribute%%%%%%%%%
    for l=1:m
        col=l;
        r=[];
        eval(['ssr' num2str(col) '=[];']);
        for j=1:n      
            a=data(j,col);
            x=data(:,col);       
            for k=1:j
                r(j,k)=ufrs_kersim(a,x(k),Epsilon(l));
                r(k,j)=r(j,k);
            end
        end
        eval(['ssr' num2str(col) '=r;']);
    end 
    
  FE_x=zeros(n,m);
  FRC_x=zeros(n,m);
  weight_x=zeros(n,m);
for l=1:m
 RM=eval(['ssr' num2str(l)]);
 FE_tem=0;
for r=1:n
    a1=sum(RM(r,:));
    nSetB_tem=a1/n;
    FE_tem=FE_tem+(1/n)*log2(1/nSetB_tem);
end
t=1;
while (t<=n)
   RM_temp=RM;
   RM_temp(t,:)=[];
   RM_temp(:,t)=[];
   FE_xtem=0;
   for e=1:n-1 
    a2=sum(RM_temp(e,:));
    FE_xtemp=a2/(n-1);
    FE_xtem=FE_xtem+(1/(n-1))*log2(1/FE_xtemp);
   end
   FE_x(t,l)=FE_xtem;
   FRC_x(t,l)=sum(RM(t,:))-sum(sum(RM_temp))/(n-1);
   weight(t,l)=sqrt(sum(RM(t,:))/n);
   t=t+1;
end

FE(l)=FE_tem;
end
%%
FRC_x(isnan(FRC_x)) = n;
RFE=1-FE_x./repmat(FE,n,1);
RFE(RFE<0) = 0;
RFE(RFE>1) = 0;
RFE(isnan(RFE)) = 0;
FOD_Xl=zeros(n,m);
for r=1:n
 FOD_temp=RFE(r,:);
    for s=1:m
        if FRC_x(r,s)>0
          FOD_Xl(r,s)=FOD_temp(s)*((n-abs(FRC_x(r,s)))/(2*n));  
        else 
          FOD_Xl(r,s)=FOD_temp(s)*sqrt(((n+abs(FRC_x(r,s)))/(2*n)));  
        end
    end
end
%%
[d,e]=sort(FE,'descend');
L=m;
while L>0
l=m-L;
lA_de=e(1:L);
eval(['ssr_deA' num2str(L) '=zeros(n,n);']);
%eval(['NbrSet_deA' num2str(l) '=zeros(n,n);']);
ssr_de_tmp=eval(['ssr' num2str(lA_de(1))]);
for j=1:L
        ssr_de_tmpAtemp=eval(['ssr' num2str(lA_de(j))]);
        ssr_de_tmp=min(ssr_de_tmp,ssr_de_tmpAtemp);
end
  eval(['ssr_deA' num2str(L) '=ssr_de_tmp;']); 
  L=L-1;
end

FE_deA=zeros(1,m);
FE_deA_x=zeros(n,m);
FRC_deA_x=zeros(n,m);
weightA_de=zeros(n,m);
for l=1:m
 RM_deA=eval(['ssr_deA' num2str(l)]);
 FE_deA_tem=0;
for r=1:n
    a1=sum(RM_deA(r,:));
    nSetB_deA_tem=a1/n;
    FE_deA_tem=FE_deA_tem+(1/n)*log2(1/nSetB_deA_tem);
end
t=1;
while (t<=n)
   RM_deA_temp=RM_deA;
   RM_deA_temp(t,:)=[];
   RM_deA_temp(:,t)=[];
   FE_deA_xtem=0;
   for e=1:n-1 
    a2=sum(RM_deA_temp(e,:));
    FE_deA_xtemp=a2/(n-1);
    FE_deA_xtem=FE_deA_xtem+(1/(n-1))*log2(1/FE_deA_xtemp);
   end
   FE_deA_x(t,l)=FE_deA_xtem;
   FRC_deA_x(t,l)=sum(RM_deA(t,:))-sum(sum(RM_deA_temp))/(n-1);
   weightA_de(t,l)=sqrt(sum(RM_deA(t,:))/n); 
   t=t+1;
end
FE_deA(l)=FE_deA_tem;
end
%%
FRC_deA_x(isnan(FRC_deA_x)) = n;
RFE_deA=1-FE_deA_x./repmat(FE_deA,n,1);
RFE_deA(RFE_deA<0) = 0;
RFE_deA(RFE_deA>1) = 0;
RFE_deA(isnan(RFE_deA)) = 0;
FOD_deA_Xl=zeros(n,m);
for r=1:n
 FODA_temp=RFE_deA(r,:);
    for s=1:m
        if FRC_deA_x(r,s)>0
          FOD_deA_Xl(r,s)=FODA_temp(s)*((n-abs(FRC_deA_x(r,s)))/(2*n));  
        else 
          FOD_deA_Xl(r,s)=FODA_temp(s)*sqrt(((n+abs(FRC_deA_x(r,s)))/(2*n)));  
        end
    end
end
%%
FEOF=zeros(n,2);
for j=1:n
    FEOF_temp=[];
    temp2=FOD_deA_Xl(j,:);
    temp1=FOD_Xl(j,:);
    FEOF_temp=1-((sum((1-temp1).*weight(j,:))+sum((1-temp2).*weightA_de(j,:)))/(2*m));
    FEOF_temp=[j,FEOF_temp];
    FEOF(j,1:length(FEOF_temp))=FEOF_temp;
end
FEOF=sortrows(FEOF,-2);
end
function kersim=ufrs_kersim(a,x,e)
if abs(a-x)>e
    kersim=0;
else
    if (e==0)
        if (a==x)
            kersim=1;
        else
            kersim=0;
        end
    else
        kersim=1-abs(a-x);    
    end
end
end
