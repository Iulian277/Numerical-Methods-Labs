% [ABOUT]
%       This is a tester function for 
%       solving an upper triangular system (U * x = b)
%
% [USES]
%       utils/SST.m 

function [] = SST_test()
  n = 3;
  U = triu(rand(n, n))
  b = rand(n, 1)

  x_true = U \ b
  x_alg  = SST(U, b)
  
  err = norm(x_true - x_alg)
endfunction