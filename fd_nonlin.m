% Eingabe:
%   u   Vektor u der Groesse (N + 1) × 1
%   N   Anzahl von Teilintervallen N.
% Ausgabe:
%   F   Vektor F(u) der Groesse (N + 1) × 1
%
function F = fd_nonlin(u, N)

    global c;
    % Stepsize
    h = c.d / N;
    
    % From 0 to N are N + 1 elements
    F(:,1) = 0:N;
    
    % For matrix - see finite_differenzen.mlx, at the end of Aufg. 2.1
    
    F(1,1) = ( -((((2*c.S_L)/h) + ((2*c.D)/(h*h)) + c.k_1 + (c.k_2*c.N_D) )*u(1)) - (c.k_2*(u(1)*u(1))) + (((2*c.D)/(h*h))*(u(2))) );
    
    for i=2:N
        F(i,1) = ( ((c.D/(h*h)).*u(i-1)) - (( ((2*c.D)/(h*h)) + c.k_1 + (c.k_2*c.N_D) ).*u(i)) - (c.k_2*(u(i).*u(i))) + ((c.D/(h*h)).*u(i+1)) );
    end
    
    F(N+1,1) = ((((2*c.D)/(h*h))*u(N-1)) - ((((2*c.S_R)/h) + ((2*c.D)/(h*h)) + c.k_1 + (c.k_2*c.N_D) )*u(N)) - (c.k_2*(u(N)*u(N))) );
    
end
