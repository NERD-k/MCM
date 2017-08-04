clc,clear all

load('m1')
load('m2')
load('Dt1')
load('Dt2')

temp1 = 0;
for i = 1:length(Dt1)
    num1(i) = 60 ./ floor(Dt1(i));
    if isinteger(num1(i))
    else num1(i) = round(num1(i));
    end
    temp1 = (60 + temp1) - num1(i) .* Dt1(i);
end

temp2 = 0;
for i = 1:length(Dt1)
    num2(i) = 60 ./ floor(Dt2(i));
    if isinteger(num2(i))
    else num2(i) = round(num2(i));
    end
    temp2 = (60 + temp2) - num2(i) .* Dt2(i);
end

num1
num2
