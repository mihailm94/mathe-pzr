% Eingabe:
%   t   Vektor der Zeitschritten
%   u   Vektor u der Groesse (N + 1) × 1
% Ausgabe:
%   F   Vektor F(u) der Groesse (N + 1) × 1
%
function F = fd_nonlin_4(t, u)
    
    global c;
    
    N = length(u);
    
    % Stepsize
    h = c.d / N;
    
    % Vector from 0 to d, in evenly spaced steps
    z = 0:h:c.d;
    % Will z and tz have the same amount of elements?
    % tz = t(1):h.c:t(2);
    
    sz = s_nonlin_4(z, t); % GIO
    
    % From 0 to N are N + 1 elements
    F(:,1) = 1:N;
            
    % finite_differenzen.mlx Aufg. 4
    F(1) = ( -((((2*c.S_L)/h) + ((2*c.D)/(h*h)) + c.k_1 + (c.k_2*c.N_D) )*u(1)) - (c.k_2*(u(1)*u(1))) + (((2*c.D)/(h*h))*(u(2))) + sz(1) );
    
    for i=2:N-1
        F(i) = ( ((c.D/(h*h))*u(i-1)) - (( ((2*c.D)/(h*h)) + c.k_1 + (c.k_2*c.N_D) )*u(i)) - (c.k_2*(u(i)*u(i))) + ((c.D/(h*h))*u(i+1)) + sz(i) );
    end
    
    F(N) = ((((2*c.D)/(h*h))*u(N-1)) - ((((2*c.S_R)/h) + ((2*c.D)/(h*h)) + c.k_1 + (c.k_2*c.N_D) )*u(N)) - (c.k_2*(u(N)*u(N))) + sz(N) );
    
end
