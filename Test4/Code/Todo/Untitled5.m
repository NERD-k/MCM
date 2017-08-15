%  v=12m/s ±£ª
h=0.7825;
V=12;
P=0.105*7*9.8;
S=2*(2-h);
DS=0.105;
Tz(1)=31541.3*h-23647.747;
format long;
TX=0.625*S*V^2;
for i=1:210
    Tz(i+1)=Tz(i)-P;
    if Tz(i+1)<0;
        Tz(i+1)=0;
    end
    Theta(i+1)=atan(Tz(i+1)/TX);
    T(i+1)=sqrt(TX^2+Tz(i+1)^2);
    Y(i+1)=DS*sin(Theta(i+1));
    X(i+1)=DS*cos(Theta(i+1));
end
h1=atan(180*(2-h)/(31541.3*h-9800-78.29))
h2=atan(180*(2-h)/(31541.3*h-9800-2*78.29))
h3=atan(180*(2-h)/(31541.3*h-9800-3*78.29))
