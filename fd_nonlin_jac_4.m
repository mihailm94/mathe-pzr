% Eingabe:
%   u   Vektor u der Groesse (N + 1) × 1 
%   N   Anzahl von Teilintervallen N.
% Ausgabe:
%   J   Jacobi-Matrix DF(u) der Groesse (N + 1) × (N + 1) als sparse matrix.
%
function J = fd_nonlin_jac_4(t, u, N)
    
    global c;
        
    % Stepsize
    h = c.d / N;
    
    % Temporary matrix, used for spdiags later
    J_temp = zeros(N + 1, N + 1);

    % Upper Diagonal
    len = length(J_temp);
    J_temp(N+2:N+2:(len*len)) = (c.D/(h*h));
    J_temp(1,2) = ((2*c.D)/(h*h));

    % Lower Diagonal
    J_temp(2:N+2:(len*len)) = (c.D/(h*h));
    J_temp(N+1,N) = ((2*c.D)/(h*h));

    % Main Diagonal
    % J_temp(1:N+2:(len*len)) = ( -(((2*c.D)/(h*h)) + c.k_1 + (c.k_2*c.N_D)) - 2*c.k_2*u(1:N-1,1) );
    % I use a for loop because i cannot iterate through vector u 
    % in the statement J_temp(1:N+2:(len*len)) = ... *u(1:N-1,1)<- this
    % does not work
    for i=2:N
        J_temp(i,i) = ( -(((2*c.D)/(h*h)) + c.k_1 + (c.k_2*c.N_D)) - 2*c.k_2*u(i) );
    end
    
    % Upper Diagonal
    J_temp(1,1) = ( -(((2*c.S_L)/h) + ((2*c.D)/(h*h)) + c.k_1 + (c.k_2*c.N_D)) - 2*c.k_2*u(1) );
    J_temp(N+1,N+1) = ( -(((2*c.S_R)/h) + ((2*c.D)/(h*h)) + c.k_1 + (c.k_2*c.N_D)) - 2*c.k_2*u(1) );

    % Get the indices of the nonzero diagonals (Rückgabewert d)
    % Get the values of those diagonals (Rückgabewert B)
    [B,d] = spdiags(J_temp);
    
    % Sparse Matrix
    J = spdiags(B, d, J_temp);
    
end