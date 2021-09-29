
load Example

Dataori=Example;

trandata=Dataori;

trandata(:,2:3)=normalize(trandata(:,2:3),'range');

lammda=1;

out_score=NIEOD(trandata(:,1:end-1),lammda)
