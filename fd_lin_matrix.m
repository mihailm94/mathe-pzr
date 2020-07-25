% Berechnung der koeffizienten Matrix zur Verwendung in der
% finiten Differenzen Methode
%   Eingabe:
%       N   Anzahl von Teilintervallen
%   Ausgabe
%       A   Finite Differenzen Matrix
%           (N + 1) x (N + 1)
%
function A = fd_lin_matrix(N)
    
    global c;

    k = (c.k_1 + (c.k_2 * c.N_D));
    
    A_temp = spdiags( N + 1, N + 1 );
    
    % Stepsize
    h = c.d / N;
    
    %   1  2  3 ...
    % | X  *  * ... | <- i = 1
    % | *  *  * ... | <- i = 2
    % | .. .. ..    | <- i = ...    
    A_temp(1, 1) = ((2 * c.S_L)/h + (2*c.D/(h * h)) + k);
        
    %   1  2  3 ...
    % | *  X  * ... | <- i = 1
    % | *  *  * ... | <- i = 2
    % | .. .. ..    | <- i = ...  
    A_temp(1, 2) = -(2*c.D/(h * h));
        
    for i = 4:N+2
        %   1  2  3 ...
        % | *  *  * ... | <- i = 1
        % | X  *  * ... | <- i = 2
        % | .. .. ..    | <- i = ...
        A_temp(i - 2, i - 3) = -(c.D/(h * h));
        
        %   1  2  3 ...
        % | *  *  * ... | <- i = 1
        % | *  X  * ... | <- i = 2
        % | .. .. ..    | <- i = ... 
        A_temp(i - 2, i - 2) = ( (2*c.D/(h * h)) + k );
        
        %   1  2  3 ...
        % | *  *  * ... | <- i = 1
        % | *  *  X ... | <- i = 2
        % | .. .. ..    | <- i = ...  
        A_temp(i - 2, i - 1) = -(c.D/(h * h));
    end
    
    A_temp(N + 1, N) = -(2*c.D/(h * h));
    A_temp(N + 1, N + 1) = ((2 * c.S_R)/h + (2*c.D/(h * h)) + k);

    % Extract nonzero diagonals
    [B, d] = spdiags(A_temp);

    % Build sparse matrix
    A = spdiags(B, d, A_temp);    
    
end