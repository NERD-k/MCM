while abs(H - H0) > 0.0001 || alpha(end) > 5 || theta(end) < 74
    %% 吃水深度调整
    if (H - H0) > 7
        h = h - 0.01;
    elseif (H - H0) > 0.01
        h = h - 0.0001;
    elseif (H - H0) > 0.000001
        h = h - 0.0000001;
    elseif (H - H0) > -0.000001;
        h = h + 0.0000001;
    elseif (H - H0) > -0.001
        h = h + 0.0001;
    elseif (H - H0) > -1
        h = h + 0.01;
    end

    if alpha(end) > 5 || theta(end) < 74
        m4 = m4 + 10;
    end
    
    
    end