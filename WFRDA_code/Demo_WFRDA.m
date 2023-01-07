clc;
clear
clear all;
format shortG;


load Example_WFRDA

Dataori=Example;

trandata=Dataori;
trandata(:,2:3)=normalize(trandata(:,2:3),'range');

sigma=0.5;

out_scores=WFRDA(trandata,sigma)

