%%Multi-Fuzzy Granules Anomaly Detection (MFGAD) algorithm
%%Please refer to the following papers: 
%%Yuan Zhong et al. Multi-Fuzzy Granules Anomaly Detection,2023.
%%Uploaded by Yuan Zhong on February 11, 2023. E-mail:yuanzhong2799@foxmail.com.
function MFGAF=MFGAD(data,delta)
%%%input:
% data is data matrix without decisions, where rows for samples and columns for attributes. 
% delta is used to adjust the adaptive fuzzy radius.
%%%output
% multi-fuzzy granules anomaly factor.

[n,m]=size(data);

varepsilon=zeros(1,m);
for j=1:m
    if min(data(:,j))==0&&max(data(:,j))==1
     varepsilon(j)=std(data(:,j),1)/delta; 
    end
end

E=[];
for j=1:m
    r1=mfgad_rm(data(:,j),varepsilon(j));
    E(j)=-(1/n)*sum(log2(sum(r1,2)./n));
end
%%
[~,b_de]=sort(E,'descend');
[~,b_as]=sort(E,'ascend');

weight=zeros(n,m);

FG_de=zeros(n,m);
FG_as=zeros(n,m);

for k=1:m
    FSet=mfgad_rm(data(:,k),varepsilon(k));  
    FSet_de=mfgad_rm(data(:,b_de(1:(m-k+1))),varepsilon(b_de(1:(m-k+1))));
    FSet_as=mfgad_rm(data(:,b_as(1:(m-k+1))),varepsilon(b_as(1:(m-k+1))));
    for i=1:n
        weight(i,k)=sum(FSet(i,:))/n;  
        FG_de(i,k)=sum(FSet_de(i,:));
        FG_as(i,k)=sum(FSet_as(i,:));
    end
end
%%
FGS_de=zeros(n,m-1);
FGS_as=zeros(n,m-1);
for k=2:m
    FGS_de_temp=(FG_de(:,k)-FG_de(:,k-1))./FG_de(:,k);
    FGS_as_temp=(FG_as(:,k)-FG_as(:,k-1))./FG_as(:,k);
    
    FGS_de(1:length(FGS_de_temp),k-1)=FGS_de_temp;
    FGS_as(1:length(FGS_as_temp),k-1)=FGS_as_temp;
end
%%
MFGAF=zeros(n,1);
for j=1:n
    MFGAF(j)=1-(sum(weight(j,:))/m)*sqrt((sum(FGS_de(j,:))+sum(FGS_as(j,:)))/(2*m-2));
end
end

