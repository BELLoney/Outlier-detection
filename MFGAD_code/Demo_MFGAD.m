clear all
clc

format short
load Example.mat

Dataori=Example;

trandata=Dataori;
trandata(:,2:3)=normalize(trandata(:,2:3),'range');
sigma=1;

out_scores=MFGAD(trandata,sigma)