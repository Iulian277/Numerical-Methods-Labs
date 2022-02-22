% [ABOUT]
%       This is a tester function for 
%       solving a lower triangular system (L * x = b) 
% [USES]
%       utils/SIT.m 

function [] = SIT_test()
    n = 3;
    L = tril(rand(n, n))
    b = rand(n, 1)

    x_true = L \ b
    x_alg  = SIT(L, b)
    
    err = norm(x_true - x_alg)
endfunction