% 无参数运行的顶层文件
clc, clear all, close all;
%% load data
[train_set, test_set] = load_data('data2016.mat');
% 设定训练集的比例
proportion = 0.8;
%% method A-D
disp("runtime of ols");
tic
[w_A, test_pred_A, MSE_train_A, MSE_valid_A] = method_A(train_set,test_set,proportion);
toc
disp("runtime of Bayes");
tic
[w_B1, test_pred_B1, MSE_train_B1, MSE_valid_B1] = method_B1(train_set,test_set,proportion);
toc
disp("runtime of Incremental Bayes");
tic
[w_B2, test_pred_B2, MSE_train_B2, MSE_valid_B2] = method_B2(train_set,test_set,proportion);
toc
disp("runtime of Generalized Bayes");
tic
[w_C, test_pred_C, MSE_train_C, MSE_valid_C] = method_C(train_set,test_set,proportion);
toc
proportion = 0.8;
disp("runtime of Gaussian process regression");
tic
[test_pred_D, MSE_train_D, MSE_valid_D] = method_D(train_set,test_set,proportion);
toc
disp("runtime of fitrgp");
tic
[test_pred_m, MSE_train_m, MSE_valid_m] = matlab_gpr(train_set,test_set,proportion);
toc
[test_pred_E, MSE_train_E, MSE_valid_E] = method_E(train_set,test_set,proportion);
%% save results
% A2D = [test_pred_A test_pred_B1 test_pred_B2 test_pred_C test_pred_D];
% save('2010_A2D.mat','A2D');
% E3 = test_pred_E;
% save('2016_E3.mat','E3');