clc,clear

%% 处理底座与杆顶
gantemp = imread(strcat('D:\MCM\Test3\Code\Question4\dealPIC\gan1.png'));
gantemp = imcomplement(gantemp);
imshow(gantemp);
ganding = ginput(1);
ganding = [200+ganding(1,1) 880+ganding(1,2)];
close(figure(gcf));
yingtemp = imread(strcat('D:\MCM\Test3\Code\Question4\dealPIC\ying1.png'));
yingtemp = imcomplement(yingtemp);
imshow(yingtemp);
yingdi = ginput(1);
yingdi = [800+yingdi(1,2) 880+yingdi(1,1)];
close(figure(gcf));
dizuo = [yingdi(1,1) ganding(1,2)];


%% 处理影长
for i = 1:41
    ying = imread(strcat('D:\MCM\Test3\Code\Question4\dealPIC\ying',strcat(int2str(i),'.png')));
    ying = imcomplement(ying);
    imshow(ying);
    yingchang(i,1:2) = ginput(1);
    yingchang(i,1:2) = [yingchang(i,1)+800 yingchang(i,2)+880];
    close(figure(gcf));
end