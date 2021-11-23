%%Detecting Fuzzy Rough Granules-based Outlier Detection (FRGOD) algorithm
%%Please refer to the following papers: 
%%Yuan Zhong, Chen Hongmei, Li Tianrui, Sang Binbin, ShuWang. 
%%Outlier Detection based on fuxxy rough granules in mixed attribute data,
%%IEEE Transactions on Cybernetics,2021.
%%Uploaded by Yuan Zhong on Oct. 12, 2021. E-mail:yuanzhong2799@foxmail.com.
function FRGOF=FRGOD(data,lammda)
%%%input:
% data is data matrix without decisions, where rows for samples and columns for attributes. 
% lammda is used to adjust the adaptive fuzzy radius.
%%%output
% Ranking objects and fuzzy rough granules-based outlier factor (FRGOF).

[n,m]=size(data);

%%%%%%%%%%%%%%%%% �����l���������Ե����򼯺�
LA=1:m; %���Լ������
weight1=zeros(n,m);%������Ȩ��
weight3=zeros(n,m);%������Ȩ��
%Acc_A_a=zeros(n,m);%ȥ��һ������֮��Ľ��ƾ���
% delta=[0.1 0 0.1]; %�Լ���ֵdelta
delta=zeros(1,m);%��ʼ������뾶  
for j=1:m
    if min(data(:,j))==0&&max(data(:,j))==1
     delta(j)=std(data(:,j),1)/lammda; %����ֵ�����Ե�����뾶
    end
end
%%%%%%%%%%%%%compute relation matrices with a single attribute%%%%%%%%%
for l=1:m
col=l;
r=[];
eval(['NbrSet' num2str(col) '=zeros(n,n);']);
for j=1:n      
    a=data(j,col);
     x=data(:,col);       
     for k=1:n
         r(j,k)=ufrs_kersim(a,x(k),delta(l));
         r(k,j)=r(j,k);
     end 
end
eval(['NbrSet' num2str(col) '=r;']);
end

%%
for l=1:m
lA_d=setdiff(LA,l);
eval(['Acc_A_a' num2str(l) '=zeros(n,m);'])%ȥ��һ������֮��Ľ��ƾ���
NbrSet_tem=eval(['NbrSet' num2str(l)]);
[NbrSet_temp,ia,ic]=unique(NbrSet_tem,'rows');%iaΪ����NbrSet_temp�е�Ԫ���ھ���NbrSet_tem�е�λ�ã�
%icΪ����NbrSet_tem�е�Ԫ���ھ���NbrSet_temp�е�λ�á�
for i=1:size(NbrSet_temp,1)
    i_tem=find(ic==i);
for k=0:m-1 
if k==0
 lA_de=lA_d;
else 
lA_de=setdiff(lA_d,lA_d(k));
end
%eval(['NbrSet_deA' num2str(l) '=zeros(n,n);']);
lA_de_L=length(lA_de);%�������Ӽ�����
Low_A=[];% �ÿմ���
Upp_A=[];% �ÿմ���
   NbrSet_tmp=eval(['NbrSet' num2str(lA_de(1))]);
for j=1:lA_de_L
        NbrSet_tmpAtemp=eval(['NbrSet' num2str(lA_de(j))]);
        NbrSet_tmp=min(NbrSet_tmp,NbrSet_tmpAtemp);
end
     Low_A=sum(min(max(1- NbrSet_tmp,repmat(NbrSet_temp(i,:),n,1)),[],2));
     Upp_A=sum(max(min(NbrSet_tmp,repmat(NbrSet_temp(i,:),n,1)),[],2));
     eval(['Acc_A_a' num2str(l) '(i_tem,k+1)=Low_A/Upp_A;'])
end
  weight3(i_tem,l)=1-(sum(NbrSet_temp(i,:))/n)^(1/3); 
  weight1(i_tem,l)=(sum(NbrSet_temp(i,:))/n);
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
 FRGOF=zeros(n,2);
for j=1:n
   FRGOF_temp=[];
   FRGOF_temp=sum(FSDOG(j,:).*weight3(j,:))/m;
   FRGOF_temp=[j,FRGOF_temp];
   FRGOF(j,1:length(FRGOF_temp))=FRGOF_temp;
end

FRGOF=sortrows(FRGOF,-2);
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