function data = datapre5(odata)
data = zeros(6,28);
    for i = 1:length(odata)
        switch odata(i,1)
            case 1
                data(1,:) = data(1,:) + odata(i,2:29);
            case 2
                data(2,:) = data(2,:) + odata(i,2:29);
            case 3
                data(3,:) = data(3,:) + odata(i,2:29);
            case 4
                data(4,:) = data(4,:) + odata(i,2:29);
            case 5
                data(5,:) = data(5,:) + odata(i,2:29);
            case 6
                data(6,:) = data(6,:) + odata(i,2:29);
            otherwise   error('wrong')
        end
    end
end