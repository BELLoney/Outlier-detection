%%Detecting Fuzzy Rough Granules-based Outlier Detection (FRGOD) algorithm
%%Please refer to the following papers: 
%%Yuan Zhong, Chen Hongmei, Li Tianrui, Sang Binbin, ShuWang. 
%%Outlier Detection based on fuzzy rough granules in mixed attribute data,
%%IEEE Transactions on Cybernetics,2021.
%%Uploaded by Yuan Zhong on Oct. 12, 2021. E-mail:yuanzhong2799@foxmail.com.
%%Optimized by Yuan Zhong on Mar. 8, 2023. E-mail:yuanzhong2799@foxmail.com.
function FRGOF=FRGOD(data,lammda)
%%%input:
% data is data matrix without decisions, where rows for samples and columns for attributes. 
% lammda is used to adjust the adaptive fuzzy radius.
% Numeric attributes are normalized to [0,1]
%%%output
% Ranking objects and fuzzy rough granules-based outlier factor (FRGOF).

[n,m]=size(data);
%%%%%%%%%%%%%%%%% 计算第l个条件属性的邻域集合
delta=zeros(1,m);%初始化邻域半径  
ID=all(data<=1);
delta(ID)=std(data(:,ID),1)./lammda;
%%%%%%%%%%%%%compute relation matrices with a single attribute%%%%%%%%%
NbrSet= zeros(n, n, m);
for col=1:m
    temp=pdist2(data(:,col),data(:,col),'cityblock');
    temp(temp>delta(col))=1;
    r=1-temp;
    NbrSet(:, :, col) = r;
end
%%
LA=1:m; 
weight1=zeros(n,m);
weight3=zeros(n,m);
Acc_A_a=zeros(n, m, m);
for col=1:m
    lA_d=setdiff(LA,col);
    Acc_A_a_tem=zeros(n, m);
    [NbrSet_temp,~,ic]=unique(NbrSet(:, :, col),'rows');
    for i=1:size(NbrSet_temp,1)
        RM_temp=repmat(NbrSet_temp(i,:),n,1);
        i_tem=find(ic==i);
        for k=0:m-1 
           if k==0
               lA_de=lA_d;
            else 
               lA_de=setdiff(lA_d,lA_d(k));
            end
            NbrSet_tmp = min(NbrSet(:, :, lA_de), [], 3);
            Low_A=sum(min(max(1- NbrSet_tmp,RM_temp),[],2));
            Upp_A=sum(max(min(NbrSet_tmp,RM_temp),[],2));
            Acc_A_a_tem(i_tem,k+1)=Low_A/Upp_A;
        end
        Acc_A_a(:, :, col)=Acc_A_a_tem;
        weight3(i_tem,col)=1-(sum(NbrSet_temp(i,:))/n)^(1/3); 
        weight1(i_tem,col)=(sum(NbrSet_temp(i,:))/n);
   end
end
%%
FSDOG=zeros(n,m);
for col = 1:m
    Acc_A_a_tem = Acc_A_a(:,:,col);
    FSDOG(:,col) = 1 - ((sum((Acc_A_a_tem(:,2:m)+1)./2,2) + Acc_A_a_tem(:,1))/m).*weight1(:,col);
end
FRGOF=mean(FSDOG.*weight3,2);
end
