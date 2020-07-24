% Routine zur Loesung des entsprechenden Gleichungssystems
% unter Verwendung fd_lin_matrix()
% 
% Eingabe:
%   s   Funktionshandle auf Funktion s(z)
%       function sz = s(z) mit Spaltenvektoren z und sz
%   N   Anzahl von Teilintervallen N .
% Ausgabe:
%   z   Knotenpunkte(z0,z1,...,zN) der Groesse (N + 1) × 1
%   u   Vektor u der Groesse (N + 1) × 1
%
function [z,u] = stationaer_lin(s,N)
    
    global c;
    
    % Stepsize
    h = c.d / N;
    % Spaltenvektor von 0 bis d, in h stepsize
    z(:,1) = 0:h:c.d;
    
    sz = s(z);
    % Rationale behind multiplication - see finite_differenzen.mlx,
    % Aufgabe 2.1, II. Schritt, a) Diskretisierung der inneren Stützpunkten
    sz_lgs = (-1/c.D) * sz;

    A = fd_lin_matrix(N);
    
    u = A \ sz_lgs;
    
end