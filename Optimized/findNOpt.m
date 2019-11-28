function [tab] = findNOpt(X, f, inc, eps, maxIter)
%FINDNOPT finds the minimum number of nonequidistant interpolation knots
%needed to interpolate f with eps maximum error.
%   X is the domain on which we'd like to interpolate.
%   f is function to interpolate
%   inc is the increment of n at each try
%   eps is the maxium error we'd like to get in the end.
%   maxIter is the maximum amount of iterations to perform
%   tab is returned table - report of the process of computation. 
tab = table();
for i = 1:maxIter
    tic;
    n = length(X);
    Y = f(X);
    spline = genLinSplin(X, Y);
    mids = X(1:end-1) + diff(X) / 2;
    res = abs(f(mids) - spline(mids));
    
    errMax  = max(res);
%VIZ
%   XN = linspace(X(1), X(end), length(X));
%   subplot(2,1,1);
%   plot(XN, X, 'blue');
%   subplot(2, 1, 2);
%   semilogy( mids, res);
%ENDVIZ
    if(errMax < eps)
        time = toc;
        tab = [tab; table(n, errMax, time)];
        break
    end
    %find points, where the 2nd derivative is supposed to be the highest
    mids = X(1:end-1) + diff(X) / 2;
    segmentLength = diff(X);
    D = diff(Y) ./ segmentLength; 
    D = diff(D) ./ diff(mids);% 2nd derivative
    D = [D(1) D D(end)];    
    D = abs(D(1:end - 1) + D(2:end)); %sum of neighbours
    D = D .* segmentLength .^ 2;
    [~, inds] = maxk(D, inc);
    inds = sort(inds);
    X = mergeSorted(X, inds, mids);
    
    time = toc;
    tab = [tab; table(n, errMax, time)];
end
end

