% [ABOUT]
%       This is a tester function for Crout decomposition
% [USES]
%       lu/crout.m 

function [] = crout_test()
    n = 3;
    A = rand(n, n);
    b = rand(n, 1);

    [L U x_alg] = crout(A, b);
    
    x_alg;
    x_true  = A \ b;
    err_sol = norm(x_true - x_alg)
    
    A_recomp = L * U;
    err_mat  = norm(A - A_recomp)
endfunction