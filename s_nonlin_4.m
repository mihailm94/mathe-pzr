function sz = s_nonlin_4(t, z)
    
    % c should be defined as a global struct
    %global c;
    
    global S_0;
    
    %sz(:,1) = 1:length(z);

    %for i = 1:length(z)
    %sz = S_0*exp(-( (t.*t)/(2*(0.01*0.01)) ))*exp( -((c.alpha).*z) );
    
    alpha = 10^5;
    sz = S_0*exp(((-t.^2)/(2*0.01.^2))*exp(-alpha*z));
    %end

end