%sin map
function [x] = f4(x0)

r = 0.99999999;

% r = r + 0.0000000000000001;
x = x0;
x = r * sin(pi * x0);