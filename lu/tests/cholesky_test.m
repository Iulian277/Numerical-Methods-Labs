% [ABOUT]
%       This is a tester function for Cholesky decomposition
% [USES]
%       lu/cholesky.m 

function [] = cholesky_test()
  n = 3;
  % Generate symmetric and positive definite matrix A
  A = rand(n, n)
  A = A * A';
  A = n * eye(n);
  b = rand(n, 1);
  
  [L U x_alg] = cholesky(A, b);
  
  % Check if the algorithm converged
  if isnan(x_alg)
    return;
  endif
  
  x_alg;
  x_true  = A \ b;
  err_sol = norm(x_true - x_alg)
  
  A_recomp = L * U;
  err_mat  = norm(A - A_recomp)
endfunction
