function sz = s_nonlin(z)
    
    global c;

    sz(:,1) = 1:length(z);

    for i = 1:length(z)
        % 
        sz(i,1) = -(c.D*2) + (c.k_1 + c.k_2*c.N_D)*(z(i)^2 + z(i) + 2) + c.k_2*( (z(i)^2 + z(i) + 2)*(z(i)^2 + z(i) + 2) );
    end

end