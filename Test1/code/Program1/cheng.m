%   陈梓欣

clc,clear all

initdata();
[E,s] = predata();

T = 60;

a = E';
for i = 1:18
    nmin(i) = a(i) / 120;
    nmax(i) = a(i) / 50;
end

n = cat(2,nmin',nmax');

for i =1:18
    tmin(i) = T / nmax(i);
    tmax(i) = T / nmin(i);
end

t = cat(2,tmin',tmax');
% delete('D:\Mcm\Test1\chengP1.xlsx')
xlswrite('D:\Mcm\Test1\chengP1.xlsx', n, 'n的上下限')
xlswrite('D:\Mcm\Test1\chengP1.xlsx', t, 't的上下限')