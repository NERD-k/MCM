function [delta] = day2delta(day)
    for i = 1:365
        % 冬至到春分，在南半球
        if day(i,1) < 79
            delta(i,1) = -(23+27/60)*(pi/180)*(1-(day(i,1)+9)/88);
        % 春分到夏至，在北半球
        elseif day(i,1) < 173
            delta(i,1) = (23+27/60)*(pi/180)*(day(i,1)-79)/94;
        % 夏至到秋分，在北半球
        elseif day(i,1) < 266
            delta(i,1) = -(23+27/60)*(pi/180)*(day(i,1)-266)/93;
        % 秋分到冬至，在南半球
        elseif day(i,1) < 356
            delta(i,1) = -(23+27/60)*(pi/180)*(day(i,1)-266)/90;
        % 冬至到春分，在南半球
        else delta(i,1) = -((23+27/60)*(pi/180)-(23+27/60)*(pi/180)*(day(i,1)-356)/88);
        end
    end
end