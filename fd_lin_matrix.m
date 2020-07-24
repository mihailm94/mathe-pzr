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
    A_temp(1, 1) = -((2 * c.S_L)/(h * c.D) + (2/(h * h)) + (k/c.D)); 
    
    %   1  2  3 ...
    % | *  X  * ... | <- i = 1
    % | *  *  * ... | <- i = 2
    % | .. .. ..    | <- i = ...  
    A_temp(1, 2) = (2/(h * h));
        
    for i = 4:N+2
        %   1  2  3 ...
        % | *  *  * ... | <- i = 1
        % | X  *  * ... | <- i = 2
        % | .. .. ..    | <- i = ...
        A_temp(i - 2, i - 3) = (1/(h * h));
        
        %   1  2  3 ...
        % | *  *  * ... | <- i = 1
        % | *  X  * ... | <- i = 2
        % | .. .. ..    | <- i = ... 
        A_temp(i - 2, i - 2) = -( (2/(h * h)) + (k/c.D) );
        
        %   1  2  3 ...
        % | *  *  * ... | <- i = 1
        % | *  *  X ... | <- i = 2
        % | .. .. ..    | <- i = ...  
        A_temp(i - 2, i - 1) = (1/(h * h));
    end
    
    A_temp(N + 1, N) = (2/(h * h));
    A_temp(N + 1, N + 1) = -((2 * c.S_R)/(h * c.D) + (2/(h * h)) + (k/c.D)) ; 

    % Extract nonzero diagonals
    [B, d] = spdiags(A_temp);

    % Build sparse matrix
    A = spdiags(B, d, A_temp);    
    
end