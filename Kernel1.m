% 复合的核1
% x1,x2:两个1*8学生8门前置课成绩
% flag:仅当x1,x2同属于X的同一行时取1，添加噪声方差
% para:8*1超参数
function cov = Kernel1(x1,x2,flag,para)
    normd = sum((x1-x2).^2);
    trend = sum(((x1.*(1:size(x1,2))).^2-(x2.*(1:size(x2,2))).^2).^2);
    k1 = para(1)^2*exp(-normd/(2*para(2)^2));
    k2 = para(3)^2*(1+normd/(2*para(4)^2))^(-para(5));
    k3 = para(6)^2*exp(-trend/(2*para(7)^2));
    k4 = para(8)^2*flag;
    cov = (k1+k2+k3+k4)/1000000;
end