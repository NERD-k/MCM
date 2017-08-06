clc,clear
load data.mat;
siglemax = [5;10;6;8;16;6;8;8;22;11];

for i = 1:27
    for j = 1:10
        if red1ord(j,:,i) > siglemax(j)
            red1ord(j,:,i)
            error('i,j')
        end
    end
end


for i = 1:27
    for j = 1:10
        if red2ord(j,:,i) > siglemax(j)
            red2ord(j,:,i)
            error('i,j')
        end
    end
end

for i = 1:28
    for j = 1:10
        if write1ord(j,:,i) > siglemax(j)
            write1ord(j,:,i)
            error('i,j')
        end
    end
end

for i = 1:28
    for j = 1:10
        if write2ord(j,:,i) > siglemax(j)
            write2ord(j,:,i)
            error('i,j')
        end
    end
end