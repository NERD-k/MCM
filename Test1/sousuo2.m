num = Yup_numline;

num(1:30) = [];

num(1082:1111) = [];



T = ones(1,18);



delta = zeros(1,18);

for j = 1:18

    for t = 10:-1:1

        temp = diffn(num,t);

        x = floor((60 * j - T(j)) / t);

        for i = 1:x

            if temp(T(j) + i)-temp(T(j)+i-1) < 120

                delta(j) = t;

                  T(j+1) = t*floor((60 * j - T(j))/t) + T(j)
            break;

            end

        end

    end

       

    end