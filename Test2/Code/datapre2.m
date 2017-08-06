function data = datapre2(olddata)
for i = 0:length(olddata) / 10 - 1
    data(:,:,i+1) = olddata(10*i+1:10*i+10,:);
end
end