% 增量贝叶斯学习方法
% train_set: N*9训练集
% test_set: N*8测试集
% proportion: 划分训练集的比例
function [w, test_pred, MSE_train, MSE_valid] = method_B2(train_set,test_set,proportion)
    [sample_num,~] = size(train_set);
    train_num = round(proportion*sample_num);
    valid_num = sample_num - train_num;
    %train_set(:,9) = train_set(:,1:8)*w(8,nums);
    x_set = [train_set(1:train_num,1:8) ones(train_num,1)]';
    y_set = train_set(1:train_num,9);
    EW = zeros(9,1);
    CovW = 5*diag(ones(9,1));
    CovE = 1;
    for n = 1:1
        for i = 1:train_num
            x = x_set(:,i);
            y = y_set(i);
            %(W   =  (I 0  (W   ,   (W   ~ N((EW ,(CovW      )
            % Y)      X'1)  E)       E)        0)      CovE)
            
            %(W   ~ N((EW     ,   (CovW   CovW*X           )
            % Y)       X'*EW)      X'*CovW X'*CovW*X+CovE)
            EW = EW + CovW*x*inv(x'*CovW*x+CovE)*(y-x'*EW);
            CovW = CovW - CovW*x*inv(x'*CovW*x+CovE)*x'*CovW;
        end
        %loss(n) = mean((y_set-x_set'*EW).^2);
    end
    %plot(1:1000,loss);
    w = EW;
    MSE_train = mean((y_set-x_set'*w).^2);
    valid_pred = [train_set(train_num+1:end,1:8) ones(valid_num,1)]*w;
    valid_real = train_set(train_num+1:end,9); 
    MSE_valid = mean((valid_real-valid_pred).^2);
    [test_num,~] = size(test_set);
    test_pred = [test_set ones(test_num,1)]*w;
end