function sz = s_nonlin(z)
    
    sz(:,1) = 1:length(z);

    for i = 1:length(z)
        sz(i,1) = z(i)^2 + z(i) + 2;
    end

end