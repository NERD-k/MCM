
num = Yup_numline;
num(1:30) = [];
num(1082:1111) = [];

T = ones(1,18);
delta = zeros(1,18);

for j = 1:18
    % if j == 2 || j == 3 || j == 4 || j == 5
    %     for t = 5:-1:1
    %         k = 0;
    %         temp = diffn(num,t);
    %         for i = T(j):60*j+1
    %        if temp(i) > 120
    %           continue;
    %      else
    %       k = k+1;
    %       end 
    %        end
    %         if k == 60*j+1-T(j)
    %             delta(i) = t;
    %             T(j+1) = t*floor((60 * j - T(j))/t) + T(j);
    %         end
    %         if k == 60*j+1-T(j)
    %             delta(i) = t;
    %             T(j+1) = t*floor((60 * j - T(j))/t) + T(j);
    %         end
    %     end
        
    % else
        for t = 10:-1:1
            k = 0;
            temp = diffn(num,t);
            for l = T(i) + a(i)*t
                if temp(l) > 120
                continue;
            else
              k = k+1;
            end 
            end
            if k == 60*j+1-T(j)
                delta(i) = t;
                T(j+1) = t*floor((60 * j - T(j))/t) + T(j);
            end
        end
    end
end
 
 
