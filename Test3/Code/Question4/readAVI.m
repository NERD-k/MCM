clc,clear

%% ��ȡ��Ƶ����
fileName = 'C:\Users\kongq\Desktop\2015A.avi'; 
obj = VideoReader(fileName);

%% ��ȡ֡����
numFrames = obj.numberOfFrames;         % ֡������ 
i = 0;
for k = 1 : 1500 : numFrames            % ��ȡ����
    i = i + 1;
    Frame = read(obj, k);        %��ȡ��i֡
    imwrite(Frame,strcat('PIC\',int2str(i),'.png'),'png');    % ����֡
end
