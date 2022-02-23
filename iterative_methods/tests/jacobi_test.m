% [ABOUT]
%       This is a tester function for solving a linear system,
%       using Jacobi iterative methods
% [USES]
%       iterative_methods/jacobi.m

function [] = jacobi_test()
    n = 3;
    A = [7 2 -4; 3 6 2; 2 -5 8];
    b = [7 15 28]';
    
    % Initial approximation
    x0 = rand(3, 1);
    % Tolerance
    tol = 1e-15;
    % Maximum number of iterations
    max_iter = 1e3;
    
    [x_alg steps] = jacobi(A, b, x0, tol, max_iter);
    
    steps
    x_alg;
    x_true  = A \ b;
    err_sol = norm(x_true - x_alg)
    
endfunction