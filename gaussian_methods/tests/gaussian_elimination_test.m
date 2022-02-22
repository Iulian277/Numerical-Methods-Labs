% [ABOUT]
%       This is a tester function for solving a linear system,
%       using Gaussian elimination
% [USES]
%       qr/gaussian_elimination.m 

function [] = gaussian_elimination_test()
    n = 3;
    A = rand(n, n);
    b = rand(n, 1);
    
    [x_alg] = gaussian_elimination(A, b);
    
    x_alg;
    x_true  = A \ b;
    err_sol = norm(x_true - x_alg)
    
endfunction