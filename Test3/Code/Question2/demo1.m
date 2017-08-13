clc,clear
syms phi delta h t

t = 0;
delta=7.5806*pi/180;

sin(h) = sin(phi)*sin(delta) + cos(phi)*cos(delta)*cos(t);
f = ((sin(phi))^2*sin(delta) + sin(phi)*cos(phi)*cos(delta) - sin(delta)) ./ sqrt(1-(sin(h))^2)*cos(phi)-1;
ANS = solve(f,phi)