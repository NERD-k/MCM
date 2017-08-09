function delta = test1(month,day)
switch month
    case 1
        N = day;
    case 2
        N = 31 + day;
    case 3
        N = 31 + 28 + day;
    case 4
        N = 31 + 28 + 31 + day;
    case 5
        N = 31 + 28 + 31 + 30 + day;
    case 6
        N = 31 + 28 + 31 + 30 + 31 + day;
    case 7
        N = 31 + 28 + 31 + 30 + 31 + 30 + day;
    case 8
        N = 31 + 28 + 31 + 30 + 31 + 30 + 31 + day;
    case 9
        N = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + day;
    case 10
        N = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + day;
    case 11
        N = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + day;
    case  12
        N = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30 + day;
    otherwise error('输入的月份有错');
end
delta = (23 + 27/60).*cos((2*pi/365).*(N+10)) %- 0.908.*sin((2*pi/365).*(N+10));
% delta = 0.39795 * cos(0.98563*(N - 173));
end