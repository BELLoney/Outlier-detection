
clc;
clear
clear all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%2导入数据%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data_nameori='Example';
data_name='Example';

eval(['load ' data_nameori ';']);% 最后一列为决策属性

Dataori=Example;%将数据传给Data，方便后面引用

%%标准化原始数据
trandata=Dataori;%初始化

out_scores=IE(trandata(:,1:end-1))


