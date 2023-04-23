% [ABOUT]
%       This function is used for solving a non-linear equation f(x) = 0,
%       given a solution interval (a, b), using the Bisection method
%       Returns the solution of the non-linear equation
% [NOTE]
%       This algorithm is similar to binary search

function [x step] = bisection_method(f, a, b, tol, max_iter)
    % Sanity check for interval
    if a > b
        disp('Provided interval is not correct!');
        x = NaN;
        step = -1;
        return;
    endif

    % Sanity check for root in the interval
    if feval(f, a) * feval(f, b) > 0
        disp('No roots in the given interval!');
        x = NaN;
        step = -1;
        return;
    endif

    % Root finding
    for step = 1 : max_iter
        % Compute the midpoint: (a + b) / 2
        x = a + (b - a) / 2;

        % Compute the product f(left) * f(mid)
        f_prod = feval(f, a) * feval(f, x);

        % Check if the bisection method reached
        % convergence limit (found the root)
        if abs(feval(f, x)) < tol && abs(b - a) < tol
            return;
        endif

        % Check if we go to the left/right subinterval
        if f_prod < 0
            b = x;
        else
            a = x;
        endif
    endfor

endfunction
