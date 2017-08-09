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
