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

        % Check if the secant method reached
        % convergence limit (found the root)
        if abs(feval(f, x)) < tol && abs(b - a) < tol
            return;
        endif

        % Compute the product f(left) * f(mid)
        f_prod = feval(f, a) * feval(f, x);

        % Check if we go to the left/right subinterval
        if f_prod < 0
            b = x;
        else
            a = x;
        endif
    endfor

endfunction
