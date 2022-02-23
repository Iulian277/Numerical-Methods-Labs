% [ABOUT]
%       This is a tester function for solving a linear system,
%       using the SOR iterative method
% [USES]
%       iterative_methods/gauss_seidel.m

function [] = sor_test()
    A = [7 2 -4; 3 6 2; 2 -5 8];
    b = [7 15 28]';
    
    % Initial approximation
    x0 = rand(3, 1);
    % Tolerance
    tol = 1e-15;
    % Maximum number of iterations
    max_iter = 1e3;
    % Relaxation factor (w = 1: Gauss-Seidel)
    w = 0.95;
    
    [x_alg steps] = sor(A, b, x0, tol, max_iter, w);
    
    steps
    x_alg;
    x_true  = A \ b;
    err_sol = norm(x_true - x_alg)
    
endfunction