x = linspace(2, 20, 100);
eps = 1e-15;
inc = 100;
MaxIter = 100;
% f = @(x) 10.* x.^5 +  x .^ 3 - 15 * x .^2 + 10 .* x - 10 ;
funcs = {
    @exp "exp"; ...
    @(x) 10 .* x.^5 +  x .^ 3 - 15 * x .^2 + 10 .* x - 10, "polynomial";...
    @atan, "arcustangens";...
    @sin, "sinus";...
    @(x) x ./ log(x), "x / log(x)";...
    };
n = length(funcs);
res = cell(length(funcs), 3);
for i = 1:n
    fprintf("Doing %s\n", funcs{i, 2});
    res(i, :) = {
        funcs(i, 2), ...
        findNOpt(x, funcs{i, 1}, inc, eps, MaxIter) ...
        findNEq(x, funcs{i, 1}, inc, eps, MaxIter) ...
        };
    
    subplot(n,1,i);
    semilogy(res{i, 2}.n, res{i, 2}.errMax,'b', res{i, 3}.n, res{i, 3}.errMax, 'r');
    title(funcs{i, 2});
end

 
