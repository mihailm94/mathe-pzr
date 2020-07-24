% Newton-Verfahren für nichtlineare Gleichungssysteme 
%
%   [x, fval, exitflag] = newton(f, x0, tol, nmax)
%
% Beim Newton-Verfahren soll mindestens ein Schritt durchgeführt werden
% und die Iteration abgebrochen werden, falls für die k-te Iterierte x_k
%
% 	|| f(x_k) || + || x_k - x_(k-1) || < tol
%
% gilt. Hier ist ||.|| die (euklidsche) Länge eines Vektors. Rückgabewert 
% ist dann x_k ansonsten x_nmax.
%
% Eingabe:
%   f        Funktionshandle auf Funktionshandle [y,dy] = f(x)
%				Eingabe:
%					x 	Spaltenvektor der Unbekannten
%				Ausgabe:
%					y	Spaltenvektor des Funktionswertes an x
%					dy 	Jacobi-Matrix an x
% 	x0 		 Spaltenvektor des Startwerts x_0
% 	tol 	 Toleranz 
% 	nmax 	 maximale Anzahl an Iterationen bis Abbruch
%
% Ausgabe
% 	x 		 Spaltenvektor der näherungsweisen Nullstelle
% 	fval 	 Spaltenvektor des Funktionswertes an x
% 	exitflag Rückgabewert 1 falls Iteration Toleranzbedingung erfüllt hat 
%            ansonsten 0
%
function [x, fval, exitflag] = newton(f, x0, tol, nmax)
    
    exitflag = 0;
    x_temp = zeros( length(x0), nmax + 1);
    delta = zeros( length(x0), nmax - 1 );
    % Erster Newton Schritt
    x_temp(:,1) = x0;
    [y, dy] = f( x_temp(:,1) );
    
    for iter = 2:(nmax + 1)
        % Df(x(n))*δ(n) = −f(x(n)) ; LGS A*δ = B
        delta(:, iter - 1) = (dy \ -y);
        x_temp(:, iter) = x_temp(:, iter - 1) + delta(:, iter - 1);
        [y, dy] = f( x_temp(:,iter) );
        
        % || f(x_k) ||
        dist_f = norm( y );
        % || x_k - x_(k-1) ||
        dist_x_k = norm( (x_temp(:,iter) - x_temp(:,iter - 1)) ); 
        
        x = x_temp(:, iter);
        fval = y;

        % || f(x_k) || + || x_k - x_(k-1) || < tol
        if ((dist_f + dist_x_k) < tol)
            exitflag = 1;
            break;
        end

    end
end
