clc,clear

% Frame = imread('D:\MCM\Test3\Code\Question4\PIC\1.png');
frame = imread('D:\MCM\Test3\Code\Question4\nPIC\n1.png');

Frame = imcomplement(Frame);
imshow(Frame);

%a = sum(sum(frame(700:1080,1:800))) ./ ((1080 -700) * 800);
%frame(1:1080,1:800) = a;
%imshow(frame);
frame = imcomplement(frame);
frame(:,1:800) = 0;
frame(1:790,920:1920) = 0;

frame(find(frame(:,:) < 50)) = 0;