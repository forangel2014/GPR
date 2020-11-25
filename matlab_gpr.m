function [test_pred, MSE_train, MSE_valid] = matlab_gpr(train_set,test_set,proportion)
    [sample_num,~] = size(train_set);
    train_num = round(proportion*sample_num);

    model = fitrgp(train_set(1:train_num,1:8),train_set(1:train_num,9));
    y_train = predict(model,train_set(1:train_num,1:8));
    MSE_train = mean((train_set(1:train_num,9)-y_train).^2);
    valid_pred = predict(model,train_set(train_num+1:end,1:8));
    valid_real = train_set(train_num+1:end,9);
    MSE_valid = mean((valid_real-valid_pred).^2);
    test_pred = predict(model,test_set);
end