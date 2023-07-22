%%Fuzzy granular anomaly detection using Markov random walk (FGAS) algorithm
%%Please refer to the following papers:
%%Fuzzy granular anomaly detection using Markov random walk, Information Sciences, 2023.
%%Uploaded by Yuan Zhong on Jul. 22, 2023. E-mail:yuanzhong2799@foxmail.com.
function AS=FGAS(data,sigma)
%%%input:
% data is data matrix without decisions, where rows for samples and columns for attributes.
% All attributes should be normalized into [0,1]
% sigma is a given parameter for the radius adjustment
%%%output
%%Fuzzy anomaly score AS.

d=0.1;%
[n,m]=size(data);
phi=zeros(n,1);
Dis=zeros(n,n);
for j=1:m
    sim=1-pdist2(data(:,j),data(:,j),'cityblock');
    sim(sim<sigma)=0;
    temp=sum(sim,2)./n;
    Dis=Dis+pdist2(temp,temp);
end

A=Dis;
diag_A=sum(A,2);
B=diag(diag_A);
%P=inv(B)*A;
P=B\A;

pi_t=1/n*ones(1,n);
pi_t_temp=ones(1,n);
i=0;
while norm(pi_t_temp-pi_t,1)>0.0001
    pi_t_temp=pi_t;
    pi_t=d+(1-d)*pi_t*P;
    i=i+1;
end
pi_t_w=pi_t;
phi(1:n)=((pi_t_w-min(pi_t_w))./(max(pi_t_w)-min(pi_t_w)));
%%
AS=phi;
end
