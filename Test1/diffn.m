% �������n��λ������� A(a) - A(a-n)
function [ANS] = diffn(X,n)
temp1 = X;
temp2 = X;
temp1(1:n) = [];
temp2(length(temp2)-n+1:length(temp2)) = [];
ANS = temp1 - temp2;
end