function splineFun = genLinSplinEq(X, Y)
%GENERATELINSPLINE generates spline interpolation of f
%   X is an ascending set of equidistant points belonging to f domain
%   Y is the set of corresponding values after applying function we'd like
%   to interpolate.
n = length(X);
if ~issorted(X); error("X is not ascending!"); end
function y = spline(x)
    y = zeros(size(x));
    j = 0;
    for i = x
        j = j + 1;
        if (i < X(1)) || (X(end) < i)
            error("%f outside function's range: [%f, %f]",i, x(1), x(end));
        end
        relV = (i - X(1)) * (n - 1) / (X(end) - X(1)) + 1;
        low = floor(relV);
        up = ceil(relV);
        if up == low; y(j) = Y(low); continue; end
        y(j) = Y(low) * (up - relV) + Y(up) * (relV - low);
    end
end
    splineFun = @spline;
end

