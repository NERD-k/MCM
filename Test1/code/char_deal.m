%   �ַ�������
a = 5:23;
a = num2str(a');
b = '��';
for i = 1:19
    c(i,:) = strcat(a(i,:),b);
end

Xlabel = c;
