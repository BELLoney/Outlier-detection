function [NbrSet,H_tem,H_xl,RC_xl] = getnSet(dataArray,lammda,l,m,n)

H_tem=0;
delta=zeros(1,m-1);
for j=1:m-1
    if min(dataArray(:,j))==0&&max(dataArray(:,j))==1
     delta(j)=std(dataArray(:,j),1)/lammda;
    end
end
condiAtt=dataArray(:,1:m);
condiAtt_tem=sortrows(condiAtt,l);
NbrSet=zeros(n,m);

for i=1:n
    s1=condiAtt_tem(i,l);
    j=i;
   while (j<=i&&j>0)
       s2=condiAtt_tem(j,l);
       D=getDist(s1,s2,l,delta);
         if D==0||D<=delta(l)+eps 
              j=j-1;
         else
                 break;          
         end
    end
         a=j+1;
         j=i+1; 
        while (j<=n)
           s2=condiAtt_tem(j,l);
           D=getDist(s1,s2,l,delta);

         if D==0||D<=delta(l)+eps 
              j=j+1;
         else
                 break;            
         end
        end
         b=j-1;
 NbrSet(condiAtt_tem(i,m),(1:length(condiAtt_tem(a:b,m))))=condiAtt_tem(a:b,m)';
end
NbrSet_tem=unique(NbrSet,'rows');
for r=1:size(NbrSet_tem,1)
    a1=length(find(NbrSet_tem(r,:)~=0));
    nSetB_tem=a1/n;
    H_tem=H_tem+nSetB_tem*log2(1/nSetB_tem);
end
H_xl=zeros(1,n);
RC_xl=zeros(1,n);
t=1;
while (t<=n)
   NbrSet_te=NbrSet;
   NbrSet_te(t,:)=[];
   NbrSet_te(ismember(NbrSet_te,t))=0;
   NbrSet_te=sort(NbrSet_te,2,'descend');
   NbrSet_temp=unique(NbrSet_te,'rows');
   H_xtem=0;
   for e=1:size(NbrSet_temp,1)
    a2=length(find(NbrSet_temp(e,:)~=0));
    H_xtemp=a2/(n-1);
    H_xtem=H_xtem+H_xtemp*log2(1/H_xtemp);
   end
   H_xl(t)=H_xtem;
   RC_xl(t)=length(find(NbrSet(t,:)~=0))-(length(find(NbrSet_temp~=0)))/size(NbrSet_temp,1);
   t=t+1;
end
end

