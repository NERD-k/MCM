function dy=test_fun(x,y)
dy = zeros(3,1);%��ʼ��������
dy(1) = y(2) * y(3);
dy(2) = -y(1) + y(3);
dy(3) = -0.51 * y(1) * y(2);

