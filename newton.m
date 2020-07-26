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
     
     x = zeros (length(x0),nmax);
     x(:,1)= x0(:);     [fx,Jx] = feval(f,x(:,1));
     x(:,2) = x0 - Jx\fx;
     
     [t,Jx] = feval(f,x(:,2));
     if (norm(t)+norm(x(:,2)-x(:,1)) < tol)
            exitflag=1;
     end
     
     for i=2:nmax+1
        [fx,Jx] = feval(f,x(:,i));
        if (norm(fx)+norm(x(:,i)-x(:,i-1)) < tol)
            exitflag=1;

             x=x(:,i);
             fval = fx;
            return
        end
        x(:,i+1) = x(:,i) - Jx\fx;
    end

fval = fx;
x=x(:,nmax+1);
end
   