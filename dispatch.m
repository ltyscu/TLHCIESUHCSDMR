function [x] = dispatch(n, x0)

switch n
    case 1
        x = f1(x0);
    case 2
        x = f2(x0);
    case 3
        x = f3(x0);
    case 4
        x = f4(x0);
end;