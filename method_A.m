% 使用最小二乘法求解线性回归问题
% train_set: N*9训练集
% test_set: N*8测试集
% proportion: 划分训练集的比例
function [w, test_pred, MSE_train, MSE_valid] = method_A(train_set,test_set,proportion)
    [sample_num,~] = size(train_set);
    train_num = round(proportion*sample_num);
    valid_num = sample_num - train_num;
    %train_set(:,9) = train_set(:,1:8)*w(8,nums);
    x = [train_set(1:train_num,1:8) ones(train_num,1)]';
    y = train_set(1:train_num,9);
    w = inv(x*x')*x*y;
    MSE_train = mean((y-x'*w).^2);
    valid_pred = [train_set(train_num+1:end,1:8) ones(valid_num,1)]*w;
    valid_real = train_set(train_num+1:end,9); 
    MSE_valid = mean((valid_real-valid_pred).^2);
    [test_num,~] = size(test_set);
    test_pred = [test_set ones(test_num,1)]*w;
end