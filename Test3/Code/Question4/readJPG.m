clc,clear

%% ֡ͼ����
for i = 1:41
    frame = imread(strcat('D:\MCM\Test3\Code\Question4\PIC\',strcat(int2str(i),'.png'))); %��ȡRGB��ʽ��ͼ��  
    Frame(:,:,:,i) = rgb2gray(frame);                        %�����еĺ�������RGB���Ҷ�ͼ���ת��  
    imwrite(Frame(:,:,:,i),strcat('D:\MCM\Test3\Code\Question4\nPIC\n',strcat(int2str(i),'.png')));
end

%% ͼ��ת
frame = imcomplement(Frame);


%% �˶���Ӱ����ֵͼ
for i = 1:41
    temp = frame(:,:,:,i);
    dealPIC(temp,i);
end
