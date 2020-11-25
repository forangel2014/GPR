% 调用核函数生成协方差矩阵
% set_name: 指定X与'谁'的协方差矩阵
% para: N*1超参数
function K = get_K(set_name,para)
    global x_set xv_set z_set
    set1 = x_set;
    num1 = size(x_set,1);
    if (set_name == 'x')
        set2 = x_set;
        num2 = size(x_set,1);
        flag = 1;
    else
        if (set_name == 'v')
            set2 = xv_set;
            num2 = size(xv_set,1);
            flag = 0;
        else
            if (set_name == 'z')
                set2 = z_set;
                num2 = size(z_set,1);
                flag = 0;
            else
                error('无效的集合名称输入');
            end
        end
    end
    K = zeros(num1,num2);
    for i = 1:num1
        x1 = set1(i,:);
        for j = 1:num2
             x2 = set2(j,:);
             K(i,j) = Kernel3(x1,x2,flag*(i==j),para);
        end
    end    
end