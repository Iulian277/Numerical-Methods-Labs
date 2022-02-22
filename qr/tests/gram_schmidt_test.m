% [ABOUT]
%       This is a tester function for QR decomposition,
%       using modified Gram Schmidt process
% [USES]
%       qr/gram_schmidt.m 

function [] = gram_schmidt_test()
    n = 3;      % Columns: x, y, z - number of unknown variables
    m = n + 1;  % Rows   : number of equations (relations)
    A = rand(m, n);
    b = rand(m, 1);

    [Q R x_alg] = gram_schmidt(A, b);
    
    x_alg;
    x_true  = A \ b;
    err_sol = norm(x_true - x_alg)
    
    A_recomp = Q * R;
    err_mat  = norm(A - A_recomp)
endfunction