function [F,J] = F_euler_UBG(f,zi,ya)
    [F,J] = f(zi);
    J = J -jacobian(J,zi);
    F = F-(J*ya);
    
end