
num = Yup_numline;
num(1:30) = [];
num(1082:1111) = [];

for i = 1:18
    
T = ones(1,18);
k = 0;
delta = zeros(1,18);
for j = 1:18
    for t = 10:-1:1
        temp = diffn(num,t);    % num(i+t) - num(i)
        x = floor((60 * j  - T(j)) / t);
        temp(1:T(j)) = [];
        for i = 1:x
            if temp(x*t+1) - temp((x-1)*t+1) < 120 %&& temp(t)< 0
                if i == x
                    delta(j) = t;
                    T(j+1) = t*floor((60 * j - T(j))/t) + T(j);
                    k = k + 1;
                end
            end
            if k == 1
                break;
            end
        end
        if k == 1
            k = 0;
            break;
        end
    end
end


