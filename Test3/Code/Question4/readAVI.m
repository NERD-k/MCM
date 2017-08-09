clc,clear

%% 读取视频数据
fileName = 'C:\Users\kongq\Desktop\2015A.avi'; 
obj = VideoReader(fileName);

%% 读取帧数据
numFrames = obj.numberOfFrames;         % 帧的总数 
i = 0;
for k = 1 : 1500 : numFrames            % 读取数据
    i = i + 1;
    Frame = read(obj, k);        %读取第i帧
    imwrite(Frame,strcat('JPG\',int2str(i),'.jpg'),'jpg');    % 保存帧
end
