function splineFun = generateLinSpline(a, b, n, f)
%GENERATELINSPLINE Summary of this function goes here
%   Detailed explanation goes here
N = n + 1;
X =  linspace(a, b, N);
Y = f(X);
    function y = spline(x)
        y = zeros(size(x));
        j = 1;
        for i = x
            if (i < a) || (b < i)
                error("x outside function's range: [%f, %f]", a, b);
            end
            relV = ((i - a) .* n) ./ (b - a);
            low = floor(relV);
            up = ceil(relV);
            %fprintf("x: %f relV: %f low: %d up: %d\n",x, relV, low, up);
            if low == up
                y(j) = Y(low + 1);
            else
                y(j) = Y(low + 1) .* (up - relV) + Y(up + 1) .* (relV - low);
            end
            j = j + 1;
        end
    end
    splineFun = @spline;
end

