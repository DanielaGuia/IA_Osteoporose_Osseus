close all
clear all

%load data 
data= readtable('Features_corrplot.xlsx');


% Correlação entre features para avaliar redundancia e n redundancia
% (redundante se valor > 0.90)


corrplot(data)


