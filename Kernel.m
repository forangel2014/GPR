% SE核
% x1,x2:两个1*8学生8门前置课成绩
% sf:信号方差超参数
% L:长度尺度超参数
function cov = Kernel(x1,x2,sf,L)
    cov = sf^2*exp(-sum((x1-x2).^2)/(2*L^2))/10000;
end