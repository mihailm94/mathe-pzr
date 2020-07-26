function [y,dy] = f_Teil_B(x)


    y = 1+0.12*(x)-x;
    dy = -1 + 0.48/(x)^3;
end 