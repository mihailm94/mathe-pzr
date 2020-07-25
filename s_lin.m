function sz = s_lin(z)
    
    global c;

    k = (c.k_1 + c.k_2*c.N_D);
    
    sz(:,1) = 1:length(z);

    for i = 1:length(z)
        sz(i,1) = ( 2*z(i) + 1) * k;
    end

end