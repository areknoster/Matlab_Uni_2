function [index] = binSearch(x,v)
%BINSEARCH finds lower bound of v value in x.
%   x must by an ascending array
%   v is a floating-point or integer number
%   index is an index of the largest value in x, which is smaller than v.
%   In case v is smaller than all values of x, index is 0.
n = length(x);
a = 1;
b = n;
if v < x(a); index = 0; return; end
if v > x(b); index = n; return; end
while a ~= b - 1
    m = floor((a + b) / 2);
    if x(m) <= v; a = m; continue; end
    b = m;
end
index = a;
end

