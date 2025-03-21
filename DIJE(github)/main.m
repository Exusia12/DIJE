clear;
close all
clc
load Yeast_cold.mat      %dataset
neighbor=0.001;
[~,m]=size(features);

select_feature=fs_DIFS_FRS(features,labels,neighbor);

