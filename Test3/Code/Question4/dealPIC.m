function [] = dealPIC(data,i)   %ganX,ganY,yingX,yingY
    %% ����˳�,��Ź���˶������ص㷶Χ200--220,880--910
    temp = data(200:220,880:910);
    tempBE=im2bw(temp,0.8);
    imwrite(tempBE,strcat('D:\MCM\Test3\Code\Question4\dealPIC\gan',strcat(int2str(i),'.png')));
    
    %% ����Ӱ��,��Ź���˶������ص㷶Χ800--900,880--1680
    % Ӱ����Χ����Ԥ����
    data(find(data(:,:) < 50)) = 0;
    Temp = data(800:900,880:1680);
    TempBE=im2bw(Temp,0.1);
    imwrite(TempBE,strcat('D:\MCM\Test3\Code\Question4\dealPIC\ying',strcat(int2str(i),'.png')));
end