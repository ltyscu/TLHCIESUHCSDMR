%Logistic map
function [x] = f2(x0)           
u = 3.999999999;

% u = u + 0.000000000000001;

x = x0;
x = u * x * (1 - x);

