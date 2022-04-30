% [ABOUT]
%       This function is used for Cholesky decomposition (A = L * L')
%       Matrix A must be positive definite
%       After that, solves the lower and upper triangular systems
%       Returns the L, U(=L') matrices and the solution of the initial system
% [USES]
%       utils/is_positive_definite.m
%       utils/SST.m
%       utils/SIT.m

function [L U x] = cholesky(A, b)
    % Grab the dimensions
    [n n] = size(A);
    
    % Initialize return matrices
    L = zeros(n);
    U = zeros(n);
    
    % Check if the input matrix A is symmetric and positive definite
    if issymmetric(A) == 0 || is_positive_definite(A) == 0
        disp('The matrix A is not symmetric and positive definite!');
        L = NaN;
        U = NaN;
        x = NaN;
        return;
    endif
  
    % For each row
    for j = 1 : n
        % Compute the diagonal elements
        sum_of_row = L(j, 1 : (j - 1)) * L(j, 1 : (j - 1))';
        L(j, j) = sqrt(A(j, j) - sum_of_row);
        % From the next column, up to the last column (on row)
        for i = (j + 1) : n
            sum_of_row = L(j, 1 : (j - 1)) * L(i, 1 : (j - 1))';
            L(i, j) = (A(j, i) - sum_of_row) / L(j, j);
        endfor
    endfor
    
    U = L';
    
    % At this point, we have A = L * U = L * L'
    % To solve the system A * x = b, we replace A with the found decomposition
    % L  * (L' * x) = b
    % L  * y = b => y (SIT)
    % L' * x = y => x (SST)
    
    % Solve the lower triangular system (L, b)
    y = SIT(L, b);
    % Solve the upper triangular system (U, y)
    x = SST(U, y);
  
endfunction
