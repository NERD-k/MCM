clc,clear

%% 帧图像处理
for i = 1:41
    frame = imread(strcat('D:\MCM\Test3\Code\Question4\PIC\',strcat(int2str(i),'.png'))); %读取RGB格式的图像  
    Frame(:,:,:,i) = rgb2gray(frame);                        %用已有的函数进行RGB到灰度图像的转换  
    imwrite(Frame(:,:,:,i),strcat('D:\MCM\Test3\Code\Question4\nPIC\n',strcat(int2str(i),'.png')));
end

%% 图像反转
frame = imcomplement(Frame);


%% 杆顶、影长二值图
for i = 1:41
    temp = frame(:,:,:,i);
    dealPIC(temp,i);
end
