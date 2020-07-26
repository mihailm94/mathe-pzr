function [max_error] = max_abs_error(f,n)
        y_new = zeros(n+1,3);
        y = zeros(n+1,3);
        y_inter = zeros(n+1,1);
        y_solve = zeros((n*10)+1,3);
    
        [~, y] = f(n);
        [~, y_solve] = f(n*10);
        for i = 1:3
            y_inter = y_solve(:,i);
            y_new(:,i) = y_inter(1:10:end)';         
        end
        
        max_error = max(max(abs(y - y_new)));    



end