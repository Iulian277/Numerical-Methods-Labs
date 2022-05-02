% [ABOUT]
%       This is a tester function for solving a 
%       non-linear equation f(x) = 0, using the Newton-Raphson method
% [USES]
%       nonlinear_equations/newton_raphson_method.m

function [] = newton_raphson_test()
    % Input polynomial function
    p = [1 0 -5]; % x^2 - 5
    
    % Initial approximation of the root
    x0 = 2;
    % Tolerance
    tol = 1e-5;
    % Maximum number of iterations
    max_iter = 1e3;    
    
    [x_alg steps] = newton_raphson_method(p, x0, tol, max_iter)
    
    % Compute the value of the polynomial in the found root
    % If it is zero, then N-R algorithm found a good root
    err_sol = polyval(p, x_alg)
    
endfunction