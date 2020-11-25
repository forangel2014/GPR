% 高斯过程回归方法，使用了修改过的核函数（见Kernel1/2/3）
% train_set: N*9训练集
% test_set: N*8测试集
% proportion: 划分训练集的比例
function [test_pred,MSE_train,mse_min] = method_E(train_set,test_set,proportion)
    global x_set xv_set y_set yv_set z_set train_num
    [sample_num,~] = size(train_set);
    train_num = round(proportion*sample_num);
    %train_set(:,9) = train_set(:,1:8)*w(8,nums);
    x_set = train_set(1:train_num,1:8);
    xv_set = train_set(train_num+1:end,1:8);
    y_set = train_set(1:train_num,9);
    yv_set = train_set(train_num+1:end,9);
    z_set = test_set;
    udelta = mean(mean(train_set(:,1:8),2)-train_set(:,9));
    para_num = 17;
    para_best = zeros(1,para_num);
    mse_min = 1000;
    for n = 1:100
        para = rand(1,para_num)*1000;
        Kxx = get_K('x',para);
        if (det(Kxx) > 0 && det(Kxx) ~= inf)
            %% train
            %loss = 1/2*y'*inv(Kxx+CovE*I)*y + 1/2*ln(det(Kxx+CovE*I))
            para = fminunc(@calculate_loss1,para);
            %% valid
            Kxx = get_K('x',para);
            Kxxv = get_K('v',para);
            valid_pred = Kxxv'*inv(Kxx)*(y_set-mean(x_set,2)+udelta)+mean(xv_set,2)-udelta;
            valid_real = yv_set; 
            MSE_valid = mean((valid_real-valid_pred).^2);
            if (MSE_valid < mse_min)
                para_best = para;
                mse_min = MSE_valid;
            end
        end
    end
    %% calculate train_set MSE
    Kxx = get_K('x',para_best);
    train_pred = Kxx'*inv(Kxx)*(y_set-mean(x_set,2)+udelta)+mean(x_set,2)-udelta;
    MSE_train = mean((train_pred-y_set).^2);
    %% predict
    Kxz = get_K('z',para_best);
    test_pred = Kxz'*inv(Kxx)*(y_set-mean(x_set,2)+udelta)+mean(z_set,2)-udelta;
end