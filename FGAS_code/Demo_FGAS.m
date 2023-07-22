clc;
clear all;
format short

load Example.mat

Dataori=Example;

trandata=Dataori;
trandata=normalize(trandata,'range');

sigma=0.6;
anomaly_score=FGAS(trandata,sigma)

