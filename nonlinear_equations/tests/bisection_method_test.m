% [ABOUT]
%       This is a tester function for solving a 
%       non-linear equation f(x) = 0, using the Bisection method
% [USES]
%       nonlinear_equations/bisection_method.m

function [] = bisection_method_test()
    % Input function
    f = @(x) x.^2 - 5;
    
    % Interval limits
    a = 2;
    b = 3;
    % Tolerance
    tol = 1e-5;
    % Maximum number of iterations
    max_iter = 1e3;    
    
    [x_alg steps] = bisection_method(f, a, b, tol, max_iter)
    
    x_true = fsolve(f, (a + b) / 2)
    err_sol = norm(x_true - x_alg)
    
    % x = linspace(-10, 10, 100);
    % plot(x, feval(f, x));
    % hold on;
    % plot([-10 10], [0 0]); % Ox
    % plot([x_true x_true], [-20 100]); % x_true
    % hold off;
   
 
endfunction