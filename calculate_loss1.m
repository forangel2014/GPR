% 计算当前超参数下的nlml
% para:N*1超参数
function loss = calculate_loss1(para)
    global y_set
    Kxx = get_K('x',para);
    loss = 1/2*y_set'*inv(Kxx)*y_set + 1/2*log(det(Kxx));
end