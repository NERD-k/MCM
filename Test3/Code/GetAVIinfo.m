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
