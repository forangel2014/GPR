% ���ϵĺ�3
% x1,x2:����1*8ѧ��8��ǰ�ÿγɼ�
% flag:����x1,x2ͬ����X��ͬһ��ʱȡ1�������������
% para:9*1������
function cov = Kernel3(x1,x2,flag,para)
    for i = 1:8
        normd = (x1(i)-x2(i))^2; 
        k(i) = para(2*i-1)^2*exp(-normd/(2*para(2*i))^2);
    end
    cov = (sum(k)+para(17)^2*flag)/200000;
end