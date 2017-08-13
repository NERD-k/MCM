%% Çó¸Ë¶¥×îÁÁÏñËØµã
for i =1:41
    temp(i) = max(max(frame(200:220,880:910,:,i)));
end

for i =1:41
    Temp(i) = find(max(max(frame(200:220,880:910,:,i))));
end


bw=im2bw(T,0.8);
imshow(bw)