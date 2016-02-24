% tent map
function [x] = f3(x0)

u = 1.99999999;

% u = u + 0.000000000000001;
x = x0;
if x < 0.5 && x > 0
    x = u * x;
elseif x >= 0.5 && x < 1
    x = u * (1 - x);
end;
    