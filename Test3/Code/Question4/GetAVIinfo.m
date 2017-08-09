clc,clear

fileName = 'C:\Users\kongq\Desktop\2015A.avi';
obj = VideoReader(fileName);

obj.Name            % ��Ƶ�ļ���
obj.Path            % ��Ƶ�ļ�·��
obj.Duration        % ��Ƶ����ʱ�����룩
obj.FrameRate       % ��Ƶ֡�٣�֡/�룩
obj.NumberOfFrames  % ��Ƶ����֡��
obj.Height          % ��Ƶ֡�ĸ߶�
obj.Width           % ��Ƶ֡�Ŀ��
obj.BitsPerPixel    % ��Ƶ֡ÿ�����ص����ݳ��ȣ����أ�
obj.VideoFormat     % ��Ƶ������, �� 'RGB24'

videoObj = mmreader('highwayII_raw.avi');%����Ƶ�ļ�
nframes = get(videoObj, 'NumberOfFrames');%��ȡ��Ƶ�ļ�֡����
for k = 1 : nframes
    currentFrame = read(videoObj, k);%��ȡ��i֡
    subplot(1,2,1),imshow(currentFrame);
   
    grayFrame = rgb2gray(currentFrame);%�ҶȻ�
    if(k==1)
        grayFrame_1 = grayFrame;
    end
    difgrayFrame= grayFrame - grayFrame_1;%��֡��
    grayFrame_1 = grayFrame;
   
    subplot(1,2,2),imshow(difgrayFrame);
end
