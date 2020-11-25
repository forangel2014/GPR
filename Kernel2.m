% ���ϵĺ�2
% x1,x2:����1*8ѧ��8��ǰ�ÿγɼ�
% flag:����x1,x2ͬ����X��ͬһ��ʱȡ1�������������
% para:9*1������
function cov = Kernel2(x1,x2,flag,para)
    for i = 1:4
        normd = (x1(2*i)+x1(2*i-1)-x2(2*i)-x2(2*i-1))^2; 
        k(i) = para(2*i-1)^2*exp(-normd/(2*para(2*i))^2);
    end
    cov = (sum(k)+para(9)^2*flag)/100000;
end