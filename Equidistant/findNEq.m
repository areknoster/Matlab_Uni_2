function [spline, tab] = findNEq(X, f, inc, eps, maxIter)
%FIND finds the minimal number of equally spaced data points for spline of
%f to have the max error of spline smaller than eps
%   a, b is the domain of f we'd like to check
%   n is the number of data points we'd like to begin with
%   inc is the increment of n at each try
%   f is function to interpolate
%   eps is the maxium error we'd like to get in the end.
%   spline is spline function which has maxium errror smaller than eps
%   n is the number of data points needed to get correct spline
%   tab is table - report of the process of computation. 
errMax = inf;
tab = table();
for q = 1:maxIter
    tic
    spline = genLinSplin(X, f(X));
    mids = X(1:end-1) +diff(X) / 2;
    res = abs(f(mids) - spline(mids));
    errMax = max(res);
    time = toc;
    %fprintf("n: %d, errMax: %d\n", length(X), errMax);
    %viz
%         XN = linspace(X(1), X(end), length(X));
%         subplot(2,1,1);
%         plot(XN, X, 'blue');
%         subplot(2, 1, 2);
%         plot( mids, res);
     %viz
    n = length(X);
    tab = [tab; table(n, errMax, time)];
    if errMax < eps; break; end
    X = linspace(X(1), X(end), length(X) + inc);
end
end