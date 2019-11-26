function [spline, tab] = findNOpt(X, f, inc, eps, maxIter)
%FINDNOPT


%TODO: blad przy inc > X len
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
        XN = linspace(X(1), X(end), length(X));
        subplot(2,1,1);
        plot(XN, X, 'blue');
        subplot(2, 1, 2);
        semilogy( mids, res);
            
    %endviz
    if(errMax < eps)
        time = toc;
        tab = [tab; table(n, errMax, time)];
        %fprintf("n: %d, errMax: %d\n", (length(X) - inc), errMax);
        break
    end
    %find points, where the 2nd derivative is supposed to be the biggest
    mids = X(1:end-1) + diff(X) / 2;
    segmentLength = diff(X); %
    D = diff(Y) ./ segmentLength; 
    D = diff(D) ./ diff(mids);% 2nd derivative
    D = [D(1) D D(end)];
    %%VIZ
    %semilogy(X, D, 'red', X, DER(X), 'blue');
    %VIZ
    
    D = abs(D(1:end - 1) + D(2:end)); %sum of neighbours
    D = D .* segmentLength .^ 2;
    [~, inds] = maxk(D, inc);
    inds = sort(inds);
    X = mergeSorted(X, inds, mids);
    
    time = toc;
    %fprintf("n: %d, errMax: %d\n", (length(X) - inc), errMax);
    tab = [tab; table(n, errMax, time)];
end
end

