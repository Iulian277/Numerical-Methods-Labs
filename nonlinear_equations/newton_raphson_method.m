% [ABOUT]
%       This function is used for solving a non-linear equation f(x) = 0,
%       given a solution interval (a, b), using the Newton-Raphson method
%       Returns the solution of the non-linear equation
% [NOTE]
%       This script works only for polynomial functions f.
%       If we want to extend the functionality of this script
%       to any type of functions, we need to approximate the value
%       of the first derivative of `f` in a certain point.

function [x step] = newton_raphson_method(f, x0, tol, max_iter)
    % Compute f derivative (polynomial deriv)
    f_deriv = polyder(f);

    for step = 1 : max_iter
        % Compute f(x0)
        f_x0 = polyval(f, x0);
        
        % Compute f_deriv(x0)
        f_deriv_x0 = polyval(f_deriv, x0);
        
        % Current x_root (N-R formula)
        x = x0 - f_x0 / f_deriv_x0;
        
        % Check if we found the root
        % Or the N-R method reached convergence limit
        if abs(polyval(f, x)) < tol || abs((x - x0) / x) < tol
            return;
        endif
        
        % Update the last computed value
        x0 = x;
    endfor
    
endfunction
