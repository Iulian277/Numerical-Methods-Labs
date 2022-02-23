% [ABOUT]
%       This function is used for solving a non-linear equation f(x) = 0,
%       given a solution interval (a, b), using the Secant method
%       Returns the solution of the non-linear equation

function [x step] = secant_method(f, a, b, tol, max_iter)
    % Sanity checks
    if a > b
        disp('Given interval is not correct!');
        x = NaN;
        step = -1;
        return;
    endif
    
    if feval(f, a) * feval(f, b) > 0
        disp('No roots in the given interval!');
        x = NaN;
        step = -1;
        return;
    endif
    
    % Root finding
    for step = 1 : max_iter
        % Current x_root
        x = a - feval(f, a) * (b - a) / (feval(f, b) - feval(f, a));
        
        % Compute the product f(left) * f(mid)
        f_prod = feval(f, a) * feval(f, x);
        
        % Check if we go to the left/right subinterval
        % Or found the root
        if f_prod < 0
            b = x;
        elseif f_prod > 0
            a = x;
        else
            return;
        endif
        
        % New x_root (used only when using the `relative error`)
        % x_new = a - feval(f, a) * (b - a) / (feval(f, b) - feval(f, a));
        
        % Check if we found the root
        % Or the bisection method reached convergence limit
        if abs(feval(f, x)) < tol && abs(b - a) < tol
            return;
        endif
        % Alternatively, we can compute the `relative error`
        % abs((x_new - x) / x_new)
    endfor
    
endfunction
