% 复合的核3
% x1,x2:两个1*8学生8门前置课成绩
% flag:仅当x1,x2同属于X的同一行时取1，添加噪声方差
% para:9*1超参数
function cov = Kernel3(x1,x2,flag,para)
    for i = 1:8
        normd = (x1(i)-x2(i))^2; 
        k(i) = para(2*i-1)^2*exp(-normd/(2*para(2*i))^2);
    end
    cov = (sum(k)+para(17)^2*flag)/200000;
end