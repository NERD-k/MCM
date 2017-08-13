clc,clear

load origin.mat
for i = 1:20
    fang2(i,1) = fangwei(fujian2(i,:),fujian2(i+1,:));
    
end

for i = 1:20
    fang3(i,1) = fangwei(fujian3(i,:),fujian3(i+1,:));
end