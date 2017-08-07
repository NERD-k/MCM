
%%  数据读取，将字符串转为数值
xlswrite('hao.xlsx',redjiuhao(2,:),'redjiuh')
xlswrite('hao.xlsx',redpuhao(2,:),'redpuh')
xlswrite('hao.xlsx',writejiuhao(2,:),'writejiuh')
xlswrite('hao.xlsx',writepuhao(2,:),'writepuh')

redjiuh = xlsread('hao.xlsx','redjiuh')
redpuh = xlsread('hao.xlsx','redpuh')
writejiuh = xlsread('hao.xlsx','writejiuh')
writepuh = xlsread('hao.xlsx','writepuh')

%%  合并序号
redjiu = cat(1,redjiuh,redjiulei);
redpu = cat(1,redpuh,redputaolei);
writejiu = cat(1,writejiuh,writejiulei);
writepu = cat(1,writepuh,writeputaolei);

%%  排序
redjiun = sortrows(redjiu',1);
redpun = sortrows(redpu',1);
writejiun = sortrows(writejiu',1);
writepun = sortrows(writepu',1);

%%  去除序号项
redjiun(:,1) = [];
redpun(:,1) = [];
writejiun(:,1) = [];
writepun(:,1) = [];

%%  葡萄中没有醚类物质，去除葡萄中的醚类物质项
redpun(:,5) = [];
writepun(:,5) = [];