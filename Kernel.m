% SE��
% x1,x2:����1*8ѧ��8��ǰ�ÿγɼ�
% sf:�źŷ������
% L:���ȳ߶ȳ�����
function cov = Kernel(x1,x2,sf,L)
    cov = sf^2*exp(-sum((x1-x2).^2)/(2*L^2))/10000;
end