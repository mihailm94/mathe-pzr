function [max_error] = error_ord(f,n,f_solve)
    k = length(n);
    max_error = zeros(k,1);

    
   
    
    
    for i = 1:k
        [t, y] = f(n(i));
        max_error(i) = max(abs(y - f_solve(t)));    
    end



end