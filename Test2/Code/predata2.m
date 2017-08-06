

%% 求总分
for i = 1:27
    red1sum(i) = sum(sum(red1ord(:,:,i)));
end
for i = 1:27
   red2sum(i) = sum(sum(red2ord(:,:,i)));
end

for i = 1:28
    write1sum(i) = sum(sum(write1ord(:,:,i)));
end
for i = 1:28
    write2sum(i) = sum(sum(write2ord(:,:,i)));
end


%% 求均值
for i = 1:27
    red1aver(i) = mean(sum(red1ord(:,:,i)'));
end
for i = 1:27
   red2aver(i) = mean(sum(red2ord(:,:,i)'));
end

for i = 1:28
    write1aver(i) = mean(sum(write1ord(:,:,i)'));
end
for i = 1:28
    write2aver(i) = mean(sum(write2ord(:,:,i)'));
end

%% 求方差
for i = 1:27
    red1var(i) = std(sum(red1ord(:,:,i))) .^ 2;
end
for i = 1:27
   red2var(i) = std(sum(red2ord(:,:,i))) .^ 2;
end

for i = 1:28
    write1var(i) = std(sum(write1ord(:,:,i))) .^ 2;
end
for i = 1:28
    write2var(i) = std(sum(write2ord(:,:,i))) .^ 2;
end
