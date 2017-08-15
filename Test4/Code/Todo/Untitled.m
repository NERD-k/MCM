T = (maolian - M) ./ (cosd(theta(2:n+1,1)));
f(1,1) = a(1) ./ sind(alpha(1));
f(2) = a(2) ./ sind(alpha(2));
f(3) = a(3) ./ sind(alpha(3));
f(4) = a(4) ./ sind(alpha(4));
f(5) = a(5) ./ sind(alpha(5));
f(6) = maolian ./ sind(theta(1));

x = cross((f(6,1) .* sind(alpha(6,1)),f(6,1) .* cosd(alpha(6,1))),0.5*(cos(belta),sin(belta)));
y = cross((f(5,1) .* sind(alpha(5,1)),f(5,1) .* sind(alpha(5,1))),0.5*(cos(belta),sin(belta)));
solve('x+y',belta)

cross(cat(2,fx,fy)

temp11 = fx(1);
    temp12 = fy(1);
    temp1 = cat(2,fx(1),fy(1));
    temp1 = cat(2,temp1,0);
    temp21 = fx(1+1);
    temp22 = fy(1+1);
    temp2 = cat(2,fx(1+1),fy(1+1));
    temp = cat(2,temp2,0);
    Temp1 = 0.5 .* cos(x);
    Temp2 = 0.5 .* sin(x);
    Temp = cat(2,Temp1,Temp2);
    Temp = cat(2,Temp,0)
    belta(1) = solve('cross(temp1,Temp1) + cross(temp2,Temp)',x);