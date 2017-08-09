clc,clear

fileName = 'C:\Users\kongq\Desktop\2015A.avi';
obj = VideoReader(fileName);

obj.Name            % 视频文件名
obj.Path            % 视频文件路径
obj.Duration        % 视频的总时长（秒）
obj.FrameRate       % 视频帧速（帧/秒）
obj.NumberOfFrames  % 视频的总帧数
obj.Height          % 视频帧的高度
obj.Width           % 视频帧的宽度
obj.BitsPerPixel    % 视频帧每个像素的数据长度（比特）
obj.VideoFormat     % 视频的类型, 如 'RGB24'

videoObj = mmreader('highwayII_raw.avi');%读视频文件
nframes = get(videoObj, 'NumberOfFrames');%获取视频文件帧个数
for k = 1 : nframes
    currentFrame = read(videoObj, k);%读取第i帧
    subplot(1,2,1),imshow(currentFrame);
   
    grayFrame = rgb2gray(currentFrame);%灰度化
    if(k==1)
        grayFrame_1 = grayFrame;
    end
    difgrayFrame= grayFrame - grayFrame_1;%邻帧差
    grayFrame_1 = grayFrame;
   
    subplot(1,2,2),imshow(difgrayFrame);
end
