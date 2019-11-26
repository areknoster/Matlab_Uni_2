x = linspace(0, 40, 100);
eps = 1e-10;
inc = 50;
MaxIter = 100;
% f = @(x) 10.* x.^5 +  x .^ 3 - 15 * x .^2 + 10 .* x - 10 ;
f = @exp;
%DER = @(x) exp(x); 
[spline1, tab1] = findNOpt(x, f, inc, eps, MaxIter);
disp("EQ\n");
[spline2, tab2] = findNEq(x, f, inc, eps, MaxIter);
figure
semilogy(tab1.n, tab1.errMax, 'red', tab2.n, tab2.errMax, 'blue');

 
