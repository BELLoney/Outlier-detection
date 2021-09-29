%%% Weighted Neighbourhood Information Network based Outlier Detection (WNINOD) algorithm
%%% Please refer to the following papers: 
%%% Zhong Yuan,Xianyong Zhang,Shan Feng. Hybrid data-driven outlier detection based 
%%% on neighborhood information entropy and its developmental measures[J]. 
%%% Expert Systems With Applications,2018,112: 243-257.
function out_score=NIEOD(data,lammda)
%%%input:
% data is data matrix without decisions, where rows for samples and columns for attributes. 
% Numerical attributes should be normalized into [0,1]
% Nominal attributes be replaced by different integer values
% lammda is a given parameter for the radius adjustment
%%%output
% Ranking objects and outlier score

trandata=data;
te=1:size(trandata,1);
te=te';

Data=[trandata te];

[n,m]=size(Data);

H=zeros(1,m-1);
H_x=zeros(n,m-1);
RC_x=zeros(n,m-1);
weight=zeros(n,m-1);
for l=1:m-1
weight_x=zeros(1,n);
[NbrSet,H_temp,H_xl,RC_xl]= getnSet(Data,lammda,l,m,n);
for i=1:n
  weight_temp=sqrt((length(find(NbrSet(i,:)~=0)))/n);
  weight_x(i)=weight_temp;
  weight((1:length(weight_x)),l)=weight_x'; 
end
H_x(:,l)=H_xl';
RC_x(:,l)=RC_xl';
H(l)=H_temp;
end
%%
OD_Xl=zeros(n,m-1);
for r=1:n
 OD_temp=(1-H_x(r,:)./H);
 OD_temp(OD_temp<0) = 0;
 OD_temp(OD_temp>1) = 0;
    for s=1:m-1
        if RC_x(r,s)>0
          OD_Xl(r,s)=OD_temp(s)*((n-abs(RC_x(r,s)))/(2*n)); 
        else 
          OD_Xl(r,s)=OD_temp(s)*sqrt(((n+abs(RC_x(r,s)))/(2*n))); 
        end
    end
end
%%
NEOF=zeros(n,2);
for j=1:n
    NEOF_temp=zeros(1,2);
    temp=OD_Xl(j,:);
    temp(isnan(temp)) = 0;
    NEOF_temp=1-((sum((1-temp).*weight(j,:)))/(2*m-2));
    NEOF_temp=[j,NEOF_temp];
    NEOF(j,1:length(NEOF_temp))=NEOF_temp;
end
out_score=sortrows(NEOF,-2);

