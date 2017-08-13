clc,clear

load origin.mat
time2 = 12.6833:0.05:13.6833;
ying2 = sqrt(fujian2(:,1).^2 + fujian2(:,2).^2);
time3 = 13.15:0.05:14.15;
ying3 = sqrt(fujian3(:,1).^2 + fujian3(:,2).^2);

xishu2 = [0.09814 -2.985 23.32];
xishu3 = [0.2964 -7.551 51.56];

T2 = -(xishu2(1,2) ./ (2 .* xishu2(1,1)));
T3 = -(xishu3(1,2) ./ (2 .* xishu3(1,1)));
Y2 = xishu2(1,3) - (xishu2(1,2) .^2 / 4.*xishu2(1,1));
Y3 = xishu3(1,3) - (xishu3(1,2) .^2 / 4.*xishu3(1,1));

J2 = 2 .*pi ./ 3 - (T2 - 12) .* pi ./ 12;
J3 = 2 .*pi ./ 3 - (T3 - 12) .* pi ./ 12;
jingdu2 = J2 .* (180 ./ pi);
jingdu3 = J3 .* (180 ./ pi);


save jingdu.mat;