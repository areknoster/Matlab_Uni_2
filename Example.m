f = generateLinSpline(-20,20, 100, @sin);
x= linspace(-5, 5, 12);
% y0 = sin(x);
% y1 = f(x);

%plot(x, y0, 'red', x, y1, 'green');
fplot(f, 'g');
hold on
fplot(@sin, 'r');
