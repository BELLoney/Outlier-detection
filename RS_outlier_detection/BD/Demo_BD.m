clc;
clear
clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%2��������%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data_nameori='Example';
data_name='Example';

eval(['load ' data_nameori ';']);% ���һ��Ϊ��������

Dataori=Example;%�����ݴ���Data�������������

%%��׼��ԭʼ����
trandata=Dataori;%��ʼ��

X_tem=[1,2,5,6];

out_score=BD(trandata(:,1:end-1),X_tem)
