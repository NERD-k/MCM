clc,clear
syms delta belta H
T = [12.68333333
12.98333333
13.68333333
];
x = [-1.2352 
-1.0756 
-0.7227 
];
y = [0.1730 
0.2653 
0.4484 
];

f = cos(delta) .* sin(pi ./ 12 .* (T + (belta - 2.*pi./3)./(pi ./ 12) -12)) - ...
    sqrt(x.^2+y.^2)./(H.^2 + x.^2 +y .^ 2) .* sin(atan(y./x)) 
[delta,belta,H] = fsolve(f,delta,belta,H);