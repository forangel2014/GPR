% 计算当前超参数下的nlml
% para:N*1超参数
function loss = calculate_loss(para)
    sf = para(1);
    L = para(2);
    CovE = para(3);
    global x_set y_set train_num
    Kxx = zeros(train_num,train_num);
    for i = 1:train_num
        x1 = x_set(i,:);
        for j = 1:train_num
            x2 = x_set(j,:);
            Kxx(i,j) = Kernel(x1,x2,sf,L);
        end
    end
    loss = 1/2*y_set'*inv(Kxx+CovE*eye(size(Kxx,1)))*y_set + 1/2*log(det(Kxx+CovE*eye(size(Kxx,1))));
    %loss = mean((y_set-Kxx'*inv(Kxx+CovE)*y_set).^2);
end