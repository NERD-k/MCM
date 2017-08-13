%% 全球搜索，步进大小为一度，取出3个可能性最大的值
    ind2 = find(cha2 == min(cha2(:)));
    [x1,y1] = ind2sub([365 181],ind2);
    % cha2(x1,y1) = max(cha2(:));
    
    % ind2 = find(cha2 == min(cha2(:)));
    % [x2,y2] = ind2sub([365 181],ind2);
    % cha2(x2,y2) = max(cha2(:));
    
    % ind2 = find(cha2 == min(cha2(:)));
    % [x3,y3] = ind2sub([365 181],ind2);
    
    ind3 = find(cha3 == min(cha3(:)));
    [X1,Y1] = ind2sub([365 181],ind3);
    % cha3(X1,Y1) = max(cha3(:));
    
    % ind3 = find(cha3 == min(cha3(:)));
    % [X2,Y2] = ind2sub([365 181],ind3);
    % cha3(X2,Y2) = max(cha3(:));
    
    % ind3 = find(cha3 == min(cha3(:)));
    % [X3,Y3] = ind2sub([365 181],ind3);


