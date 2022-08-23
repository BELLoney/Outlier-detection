clear
clc
filename='speech';
eval(['load ' filename '.mat']);

dataori=[X y+1];
trandata=dataori;
trandata(:,1:end-1)=normalize(trandata(:,1:end-1),'range');

save(filename,'trandata');
xlswrite([filename 'ori'],dataori);
