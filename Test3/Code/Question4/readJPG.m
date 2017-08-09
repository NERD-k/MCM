clc,clear

%% 帧图像处理
for i = 1:41
    frame = imread(strcat('D:\MCM\Test3\Code\Question4\JPG\',strcat(int2str(i),'.jpg'))); %读取RGB格式的图像  
    Frame = rgb2gray(frame);                        %用已有的函数进行RGB到灰度图像的转换  
    imwrite(Frame,strcat('D:\MCM\Test3\Code\Question4\nJPG\n',strcat(int2str(i),'.jpg')));
end