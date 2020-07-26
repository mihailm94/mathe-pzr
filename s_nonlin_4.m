function sz = s_nonlin_4(t, z)
    
    % c should be defined as a global struct
    global c;
    
    global S_0;
        
    c.alpha = 10^5;
    sz = S_0*exp(((-t.^2)/(2*0.01.^2))*exp(-c.alpha*z));

end