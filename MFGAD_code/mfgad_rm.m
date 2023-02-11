function rm=mfgad_rm(subdata,e)
if all(e==0)
    rm=pdist2(subdata,subdata,'cityblock')==0;
else
    temp1=pdist2(subdata(:,1),subdata(:,1),'cityblock');
    temp1(temp1>e(1))=1;
    rm=1-temp1;
    for j=2:length(e)
        temp=pdist2(subdata(:,j),subdata(:,j),'cityblock');
        temp(temp>e(j))=1;
        rm=min(rm,1-temp);
    end     
end