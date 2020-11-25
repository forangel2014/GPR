% 复合的核2
% x1,x2:两个1*8学生8门前置课成绩
% flag:仅当x1,x2同属于X的同一行时取1，添加噪声方差
% para:9*1超参数
function cov = Kernel2(x1,x2,flag,para)
    for i = 1:4
        normd = (x1(2*i)+x1(2*i-1)-x2(2*i)-x2(2*i-1))^2; 
        k(i) = para(2*i-1)^2*exp(-normd/(2*para(2*i))^2);
    end
    cov = (sum(k)+para(9)^2*flag)/100000;
end