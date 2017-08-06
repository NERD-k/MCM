clc,clear
load data.xlsx
data = zscore(data);
r = cov(data);
[vec1,val,con] = pcacov(r)
f1 = repmat(sign(sum(vec1)),size(vec1,1),1);
vec2 = vec1 .* f1;
f2 = remat(sqrt(val)',size(vec2,1),1);
a = vec2 .* f2;
num = input('请选择主因子个数：');
am = a(:,[1:num]);
[b,t] = rotatefactors(am,'method','varimax')
bt = [b,a(:,[num + 1:end])];
degree = sum(b .^ 2,2)
contr = sum(bt .^ 2)
rate = contr(1:num) / sum(contr)
coef = inv(r) * b