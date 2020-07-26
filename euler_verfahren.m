% EULER_VERFAHREN zur Lösung von skalaren Anfangswertproblemen
%   [t,y] = EULER_VERFAHREN(f,tspan,y0,n)
%   Eingabe:
%       f       Funktion Handle auf Funktion dy=f(t,y) mit
%               t       Skalar Zeit
%               dy,y    Skalar
%       tspan   Vektor mit Start- und Endzeit [a,b]
%       y0      Anfangswert (skalar)
%       n       Anzahl der Teilintervalle
%   Ausgabe
%       t       (n+1) x 1 Vektor der Zeitpunkte
%       y       (n+1) x 1 Vektor der Zustände, wobei in Zeile i der
%               Zustand zum Zeitpunkt t(i) gespeichert ist
%
function [t,y]=euler_verfahren(f,tspan,y0,n)

m = length(y0);
t0 = tspan(1);
tf = tspan(2);
h = (tf - t0)/n;
t = linspace(t0,tf,n+1);
y = zeros(m,n+1);
y(:,1) = y0';
for i=1:n
    y(:,i+1) = y(:,i) + h*f(t(i), y(:,i));
end
t = t'; y = y';
end