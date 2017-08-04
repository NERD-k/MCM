%   陈梓欣

clc,clear all

initdata();
[E,s] = predata();

T = 60;

a = E';
for i = 1:18
    nmin(i) = 0.75*a(i) / 120;
    nmax(i) = 0.75*a(i) / 50;
end

n = cat(2,nmin',nmax');

%for i =1:18
%    tmax(i) = min(T / nmax(i),T / nmin(i));
%end

t = tmax';
% delete('D:\Mcm\Test1\chengP1.xlsx')
xlswrite('D:\Mcm\Test1\chengP1.xlsx', n, 'n的上下限')
xlswrite('D:\Mcm\Test1\chengP1.xlsx', t, 't的上限')