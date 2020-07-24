function [y, dy] = f_handle_vec_jacobi(u, N, b)

    % Vektor F(u)
    y = fd_nonlin(u, N);
    
    % F(u) - b = 0
    y = y - b;
    
    % Jacobi-Matrix DF(u)
    dy = fd_nonlin_jac(u, N);
end