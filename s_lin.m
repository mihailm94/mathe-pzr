function sz = s_lin(z)
    
    sz(:,1) = 1:length(z);

    for i = 1:length(z)
        sz(i,1) = 2*z(i) + 1;
    end

end