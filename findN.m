function [spline, n] = findN(a, b, n, inc, f, eps)
%FIND Summary of this function goes here
%   Detailed explanation goes here
errMax = inf;
while errMax > eps
    spline = generateLinSpline(a, b, n, f);
    width = (b - a) ./ (n + 1); 
    x = linspace(a + width/2, b - width/2, n);
    res = abs(f(x) - spline(x));
    errMax = max(res);
    fprintf("n: %d, errMax: %d\n", n, errMax);
    n = n + inc;
end
end

