function [] = dealPIC(data,i)   %ganX,ganY,yingX,yingY
    %% 处理杆长,大概估测杆顶在像素点范围200--220,880--910
    temp = data(200:220,880:910);
    tempBE=im2bw(temp,0.8);
    imwrite(tempBE,strcat('D:\MCM\Test3\Code\Question4\dealPIC\gan',strcat(int2str(i),'.png')));
    
    %% 处理影长,大概估测杆顶在像素点范围800--900,880--1680
    % 影子周围像素预处理
    data(find(data(:,:) < 50)) = 0;
    Temp = data(800:900,880:1680);
    TempBE=im2bw(Temp,0.1);
    imwrite(TempBE,strcat('D:\MCM\Test3\Code\Question4\dealPIC\ying',strcat(int2str(i),'.png')));
end