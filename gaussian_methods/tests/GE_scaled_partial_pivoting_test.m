% [ABOUT]
%       This is a tester function for solving a linear system,
%       using Gaussian elimination with partial pivoting
% [USES]
%       qr/GE_scaled_partial_pivoting.m

function [] = GE_scaled_partial_pivoting_test()
    n = 3;
    A = rand(n, n);
    b = rand(n, 1);

    [x_alg] = GE_scaled_partial_pivoting(A, b);

    x_alg;
    x_true  = A \ b;
    err_sol = norm(x_true - x_alg)

endfunction
