clc,clear

fileName = 'C:\Users\kongq\Desktop\2015A.avi'; 
obj = VideoReader(fileName);

numFrames = obj.NumberOfFrames
for k = 1 : 5            % ��ȡ����
     frame = read(obj,k);
     imshow(frame);               %��ʾ֡
     imwrite(frame(k),strcat(int2str(k),'.jpg'),'jpg');    % ����֡
end
