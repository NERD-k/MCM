clc,clear

%% ֡ͼ����
for i = 1:41
    frame = imread(strcat('D:\MCM\Test3\Code\Question4\JPG\',strcat(int2str(i),'.jpg'))); %��ȡRGB��ʽ��ͼ��  
    Frame = rgb2gray(frame);                        %�����еĺ�������RGB���Ҷ�ͼ���ת��  
    imwrite(Frame,strcat('D:\MCM\Test3\Code\Question4\nJPG\n',strcat(int2str(i),'.jpg')));
end