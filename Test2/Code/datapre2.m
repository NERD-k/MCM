function data = datapre2(olddata)
    for i = i:length(olddata) / 10
        data(:,:,i) = olddata(10*i-9:10*i,:);
    end
end