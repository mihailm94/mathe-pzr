function sz = s_experimentell(z)
    
    global c;
    
    global S_0;
    
    sz(:,1) = 1:length(z);

    for i = 1:length(z)
        sz(i,1) = S_0*exp(-(c.alpha*z(i)));
    end

end