% [ABOUT]
%       This function is used for LU Crout decomposition only for 3diag mat
% [INPUT] 
%       `d`  - subdiagonal
%       `a`  - main diagonal
%       `c`  - superdiagonal
% [OUTPUT]
%       `L` and `U` - Resulted matrices, such that L * U = A

function [L U] = lu_crout_3diag(d, a, c)
    % Grab the dimenstions
    n = length(a);
    
    % Initialize the result matrices
    L = zeros(n);
    U = eye(n);
    
    % 2-indexing
    d = [inf d];

    % Initialize first elements
    L(1, 1) = a(1);
    U(1, 2) = c(1) / L(1, 1);

    % Solve the system, using  forward substitution
    for i = 2 : (n - 1)
        L(i, i - 1) = d(i);
        L(i, i)     = a(i) - L(i, i - 1) * U(i - 1, i);
        U(i, i + 1) = c(i) / L(i, i);
    endfor 

    % Calculate the last row of `L`
    L(n, n - 1) = d(n);
    L(n, n)     = a(n) - L(n, n - 1) * U(n - 1, n);
 endfunction
 