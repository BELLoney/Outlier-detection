
data_nameori='Example';
data_name='Example';

eval(['load ' data_nameori ';']);

Dataori=Example;

trandata=Dataori;
trandata(:,2:3)=normalize(trandata(:,2:3),'range');
lam=1;

out_factor=FRGOD(trandata,lam)
