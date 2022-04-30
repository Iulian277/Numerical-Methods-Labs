% [ABOUT]
%       This is a tester function for QR decomposition,
%       using Householder transformation
% [USES]
%       qr/householder.m 

function [] = householder_test()
    n = 3;
    A = [3 -2 3; 0 3 5; 4 4 4]
    b = rand(3, 1);

    [Q R x_alg] = householder(A, b);
    
    x_alg;
    x_true  = A \ b;
    err_sol = norm(x_true - x_alg)
    
    A_recomp = Q * R;
    err_mat  = norm(A - A_recomp)
endfunction