function splineFun = genLinSplin(X, Y)
%GENERATELINSPLINE generates spline interpolation of f
%   X is an ascending set of points belonging to f domain. They don't have to be
%   equidistant (see genLinSplinEq).
%   Y is the set of corresponding values after applying function we'd like
%   to interpolate.
    if ~issorted(X); error("X is not ascending!"); end
    function y = spline(x)
        y = zeros(size(x));
        j = 0;
        for i = x
            j = j + 1;
            if (i < X(1)) || (X(end) < i)
                error("%f outside function's range: [%f, %f]",i, x(1), x(end));
            end
            low = binSearch(X, i);
            if X(low) == i; y(j) = Y(j); continue; end
            relV = (i - X(low)) /  (X(low+1) - X(low));
            y(j) = Y(low) * (1 - relV) + Y(low + 1) * relV;
        end
    end
    splineFun = @spline;
end

