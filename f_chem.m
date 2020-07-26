% Eingabe
% t     : Zeit t
% y     : Vector y der Größe 3 x 1
% Ausgabe
% t     : Zeit t
% dy    : Vector f_chem der Größe 3 x 1
function dy = f_chem(t,y)
    %Speicherplatz Reservierung/alojamiento de memoria
    dy = zeros(3,1); 
    
    %Berechnen von dy/calculo de dy
    dy = [-0.04*y(1)+10^4*y(2)*y(3);
           0.04*y(1)-10^4*y(2)*y(3)-3*10^7*y(2)^2;
           3*10^7*y(2)^2];
end