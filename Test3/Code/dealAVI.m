clc,clear

fileName = 'C:\Users\kongq\Desktop\2015A.avi'; 
obj = VideoReader(fileName);

numFrames = obj.NumberOfFrames
for k = 1 : 5            % 读取数据
     frame = read(obj,k);
     imshow(frame);               %显示帧
     imwrite(frame(k),strcat(int2str(k),'.jpg'),'jpg');    % 保存帧
end
