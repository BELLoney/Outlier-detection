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

out_scores=SEQ(trandata(:,1:end-1))

