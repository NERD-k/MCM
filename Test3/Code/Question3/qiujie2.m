function [DAan] = qiujie2(Wei,Day)
    W = length(Wei);
    D = length(Day);
    W1 = [];
    De1 = [];
    
    for i = 1:D
        W1 = cat(1,W1,W);
    end
    W1 = W1';
    
    phi = W1;
    De = day2delta(Day);
    for i = 1:W
        De1 = cat(1,De1,De);
    end
    
    for i = 1:21
        h(:,:,i) = asin(sin(phi) .* sin(deltas) + cos(phi) .* cos(deltas) .* cos(t2(i)));
        A(:,:,i) = acos((sin(h(:,:,i)) .* sin(phi) - sin(deltas)) ./ (cos(h(:,:,i)) .* cos(phi)));
    end
    
    for i = 1:20
        DAan(:,:,i) = A(:,:,i+1) - A(:,:,i);
    end
end
    