function newdata = datapre4(data)
for i = 1:length(data(1,1,:))
    newdata(i,1) = sum(sum(data(1:2,:,i))) / length(data(1,:,1));
    newdata(i,2) = sum(sum(data(3:5,:,i))) / length(data(1,:,1));
    newdata(i,3) = sum(sum(data(6:9,:,i))) / length(data(1,:,1));
    newdata(i,4) = sum(data(10,:,i)) / length(data(1,:,1));
end
        