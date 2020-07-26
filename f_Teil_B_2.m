function [y,dy] = f_Teil_B_2(x)
    y = [4+x(1)-5*x(2);2+5*x(1)-2*x(2)];
    dy = [0 -5;5 -2];
end