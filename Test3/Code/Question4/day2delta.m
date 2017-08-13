function [delta] = day2delta(day)
        % 冬至到春分，在南半球
        if day < 79
            delta = -(23+27/60)*(pi/180)*(1-(day+9)/88);
        % 春分到夏至，在北半球
        elseif day < 173
            delta = (23+27/60)*(pi/180)*(day-79)/94;
        % 夏至到秋分，在北半球
        elseif day < 266
            delta = -(23+27/60)*(pi/180)*(day-266)/93;
        % 秋分到冬至，在南半球
        elseif day < 356
            delta = -(23+27/60)*(pi/180)*(day-266)/90;
        % 冬至到春分，在南半球
        else delta = -((23+27/60)*(pi/180)-(23+27/60)*(pi/180)*(day-356)/88);
        end
end