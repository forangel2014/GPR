% 高斯过程回归方法，基础实现，使用了普通的SE核
% train_set: N*9训练集
% test_set: N*8测试集
% proportion: 划分训练集的比例
function [test_pred,MSE_train,mse_min] = method_D(train_set,test_set,proportion)
    global x_set xv_set y_set yv_set z_set train_num
    [sample_num,~] = size(train_set);
    [test_num,~] = size(test_set);
    train_num = round(proportion*sample_num);
    valid_num = sample_num - train_num;
    %train_set(:,9) = train_set(:,1:8)*w(8,nums);
    x_set = train_set(1:train_num,1:8);
    xv_set = train_set(train_num+1:end,1:8);
    y_set = train_set(1:train_num,9);
    yv_set = train_set(train_num+1:end,9);
    z_set = test_set;
    udelta = mean(mean(train_set(:,1:8),2)-train_set(:,9));
    sf_best = 0;
    L_best = 0;
    CovE_best = 0;
    mse_min = 1000;
    for n = 1:1000
        sf = rand()*1000;
        L = rand()*1000;
        CovE = rand()*1000;
        Kxx = zeros(train_num,train_num);
        for i = 1:train_num
            x1 = x_set(i,:);
            for j = 1:train_num
                x2 = x_set(j,:);
                Kxx(i,j) = Kernel(x1,x2,sf,L);
            end
        end
        if (det(Kxx+CovE*eye(size(Kxx,1))) > 0 && det(Kxx+CovE*eye(size(Kxx,1))) ~= inf)
            %% train
            %loss = 1/2*y'*inv(Kxx+CovE*I)*y + 1/2*ln(det(Kxx+CovE*I))
            para = fminunc(@calculate_loss,[sf,L,CovE]);
            sf = para(1);
            L = para(2);
            CovE = para(3);
            %% valid
            Kxx = zeros(train_num,train_num);
            for i = 1:train_num
                x1 = x_set(i,:);
                for j = 1:train_num
                    x2 = x_set(j,:);
                    Kxx(i,j) = Kernel(x1,x2,sf,L);
                end
            end
            Kxxv = zeros(train_num,valid_num);
            for i = 1:train_num
                x = x_set(i,:);
                for j = 1:valid_num
                    xv = xv_set(j,:);
                    Kxxv(i,j) = Kernel(x,xv,sf,L);
                end
            end
            valid_pred = Kxxv'*inv(Kxx+CovE*eye(size(Kxx,1)))*(y_set-mean(x_set,2)+udelta)+mean(xv_set,2)-udelta;
            valid_real = yv_set; 
            MSE_valid = mean((valid_real-valid_pred).^2);
            if (MSE_valid < mse_min)
                sf_best = sf;
                L_best = L;
                CovE_best = CovE;
                mse_min = MSE_valid;
            end
        end
    end
    %% calculate train_set MSE
     Kxx = zeros(train_num,train_num);
        for i = 1:train_num
            x1 = x_set(i,:);
            for j = 1:train_num
                x2 = x_set(j,:);
                Kxx(i,j) = Kernel(x1,x2,sf_best,L_best);
            end
        end
    train_pred = Kxx'*inv(Kxx+CovE_best*eye(size(Kxx,1)))*(y_set-mean(x_set,2)+udelta)+mean(x_set,2)-udelta;
    MSE_train = mean((train_pred-y_set).^2);
    %% predict
    Kxz = zeros(train_num,test_num);
    for i = 1:train_num
        x = x_set(i,:);
        for j = 1:test_num
            z = z_set(j,:);
            Kxz(i,j) = Kernel(x,z,sf_best,L_best);
        end
    end
    test_pred = Kxz'*inv(Kxx+CovE_best*eye(size(Kxx,1)))*(y_set-mean(x_set,2)+udelta)+mean(z_set,2)-udelta;
end