clc,clear

g=9.8;%重力加速度
v=36;%风速
rou=1025;%海水密度
ma=1000;da=2;ha=2;%浮标
mb=10;db=0.05;lb=1;%钢管
mc=100;lc=1;dc=0.3;%钢桶
ball=1200;%重物
md=7;ld=0.105;Ld=22.05;nd=Ld/ld;md=md*ld*g;  %锚链
me=600;
Ffb=rou*g*pi*db^2/4*lb;  %钢管的浮力
mb=mb*g;  %钢管的质量
t=1;
for ball=1200:2:3000
    for h1=0.7:0.01:1.1
        for h2=0:0.01:1.5
        L=h1;
        R=0;
        S1=da*(ha-(h1+h2)/2)*da/sqrt((h2-h1)^2+da^2);
        S2=pi*da^2*(h2-h1)/da;
        S=S1+S2;
        Fw=0.625*S*v^2;  %风荷载
        V=pi*da^2*(h1+h2);  %排水体积
        Ffa=rou*g*v;   %浮标浮力
        Ta1=Ffa-ma*g;  %竖直方向
        Ta2=Fw;      %水平方向
        Ta=sqrt(Ta1^2+Ta2^2);   %浮标总拉力
        thetaa=atand(Ta1/Ta2);    %浮标拉力的角度
        alphaa=atand((h2-h1)/da);
        %钢管
        for k=1:4
            Tb2(k)=Ta2;  %水平方向
            if k==1
                Tb1(k)=Ta1+Ffb-mb;  %竖直方向
            else
                Tb1(k)=Tb1(k-1)+Ffb-mb;  %竖直方向
            end
            thetab=atand(Tb1(k)/Tb2(k)); %拉力角度
            Tb(k)=sqrt(Tb1(k)^2+Tb2(k)^2);%拉力大小
            
            
            if k==1  %钢管的倾斜角
               alphab(k)=atand((Ta*sind(thetaa)+Tb(k)*sind(thetab(k))) / ...
                   (Tb(k)*cosd(thetab(k))+Ta*cosd(thetaa)));
            else
               alphab(k)=atand(Tb(k-1)*sind(thetab(k-1))+Tb(k)*sind(thetab(k)) / ...
                   (Tb(k)*cosd(thetab(k))+Tb(k-1)*cosd(thetab(k-1))));
            end
            
            
            if k==1  %钢管k的x长度
                xb(k)=ld*cosd(alphaa);
            else
               xb(k)=ld*cosd(alphab(k-1));
            end
            R=R+xb(k);%目前游动长度
            L=L+sind(alphab(k))*lb;
            k=k+1;
        end
        end
    end
end
