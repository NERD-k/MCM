clc,clear

g=9.8;%�������ٶ�
v=36;%����
rou=1025;%��ˮ�ܶ�
ma=1000;da=2;ha=2;%����
mb=10;db=0.05;lb=1;%�ֹ�
mc=100;lc=1;dc=0.3;%��Ͱ
ball=1200;%����
md=7;ld=0.105;Ld=22.05;nd=Ld/ld;md=md*ld*g;  %ê��
me=600;
Ffb=rou*g*pi*db^2/4*lb;  %�ֹܵĸ���
mb=mb*g;  %�ֹܵ�����
t=1;
for ball=1200:2:3000
    for h1=0.7:0.01:1.1
        for h2=0:0.01:1.5
        L=h1;
        R=0;
        S1=da*(ha-(h1+h2)/2)*da/sqrt((h2-h1)^2+da^2);
        S2=pi*da^2*(h2-h1)/da;
        S=S1+S2;
        Fw=0.625*S*v^2;  %�����
        V=pi*da^2*(h1+h2);  %��ˮ���
        Ffa=rou*g*v;   %���긡��
        Ta1=Ffa-ma*g;  %��ֱ����
        Ta2=Fw;      %ˮƽ����
        Ta=sqrt(Ta1^2+Ta2^2);   %����������
        thetaa=atand(Ta1/Ta2);    %���������ĽǶ�
        alphaa=atand((h2-h1)/da);
        %�ֹ�
        for k=1:4
            Tb2(k)=Ta2;  %ˮƽ����
            if k==1
                Tb1(k)=Ta1+Ffb-mb;  %��ֱ����
            else
                Tb1(k)=Tb1(k-1)+Ffb-mb;  %��ֱ����
            end
            thetab=atand(Tb1(k)/Tb2(k)); %�����Ƕ�
            Tb(k)=sqrt(Tb1(k)^2+Tb2(k)^2);%������С
            
            
            if k==1  %�ֹܵ���б��
               alphab(k)=atand((Ta*sind(thetaa)+Tb(k)*sind(thetab(k))) / ...
                   (Tb(k)*cosd(thetab(k))+Ta*cosd(thetaa)));
            else
               alphab(k)=atand(Tb(k-1)*sind(thetab(k-1))+Tb(k)*sind(thetab(k)) / ...
                   (Tb(k)*cosd(thetab(k))+Tb(k-1)*cosd(thetab(k-1))));
            end
            
            
            if k==1  %�ֹ�k��x����
                xb(k)=ld*cosd(alphaa);
            else
               xb(k)=ld*cosd(alphab(k-1));
            end
            R=R+xb(k);%Ŀǰ�ζ�����
            L=L+sind(alphab(k))*lb;
            k=k+1;
        end
        end
    end
end
