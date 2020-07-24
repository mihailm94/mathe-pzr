% Eingabe:
%   s   Funktionshandle auf Funktion s(z)
%       function sz=s(z) mit Spaltenvektoren z und sz
%   N   Anzahl von Teilintervallen N .
%   tol Toleranz fuer Newton-Verfahren
%   nmax maximale Anzahl an Schritten des Newton-Verfahrens
% Ausgabe:
%   z   Knotenpunkte(z0,z1,...,zN) der Groesse (N + 1) × 1
%   u   Vektor u der Groesse (N + 1) × 1
%
function [z,u]=stationaer_nonlin(s,N,tol,nmax)
    % Konstanten
    global c;
    % Stepsize
    h = c.d / N;
    % Vektor der Knotenpunkten
    z(:,1) = 0:h:c.d;
    % Vektor der Funktionswerten
    sz = feval(s, z);
    % Laut Gleichung in Aufgabe 2.2 (see finite_differenzen.mlx)
    b = (-1).*sz;
    
    % Spaltenvektor des Startwerts x_0
    x0(:,1) = 1:(N+1);
    
    % Inputs:
    %   @(u)vec_jacobi(u, N, b) - input param is vector u, output is F(u) & DF(u)
    %   x0 - Spaltenvektor des Startwerts x_0
    % Return values:
    %   u - Vektor der gesuchten Unbekannten (u0, u1, ..., uN)
    %   fval - unused
    %   exitflag - unused
    u = newton(@(u)f_handle_vec_jacobi(u, N, b), x0, tol, nmax);
    
    % call a for loop in the .mlx (stationaer_nonlin())
    % when having to "play" with Anzahl der Teilintervale n
    % for loop calls function i times
    % every next time, call n*2
    % real function value is cos(z(i))
    
end

