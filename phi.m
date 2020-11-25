% 基函数
% x:N*1列矢量
function result = phi(x)
    result = [x.^2;ones(1,size(x,2))];
end