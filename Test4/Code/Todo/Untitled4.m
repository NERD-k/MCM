sym belta
fx = f .* cosd(alpha);
fy = f .* sind(alpha);
for i = 1:5
    temp11 = fx(i);
    temp12 = fy(i);
    temp1 = cat(1,fx(i),fy(i))
    temp21 = fx(i+1);
    temp22 = fy(i+1);
    temp2 = cat(1,fx(i+1),fy(i+1));
    Temp1 = 0.5 .* cos(belta(i));
    Temp2 = 0.5 .* sin(belta(i));
    Temp = cat(1,Temp1,Temp2);
    belta(i) = solve('cross(temp1,Temp1) + cross(temp2,Temp)',belta(i));
end