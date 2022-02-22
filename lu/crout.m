% [ABOUT]
%       This function is used for Crout decomposition (A = L * U)
%       After that, solves the lower and upper triangular systems
%       Returns the L, U matrices and the solution of the initial system
% [USES] 
%       utils/SST.m
%       utils/SIT.m

function [L U x] = crout(A, b)
    % Grab the dimensions
    [n n] = size(A);
    
    % Initialize return matrices
    L = zeros(n);
    U = eye(n);
    
    % For each row
    for p = 1 : n
        % Compute L (lower triangular matrix)
        for i = p : n
            sum_for_L = L(i, 1 : (p - 1)) * U(1 : (p - 1), p);
            L(i, p) = A(i, p) - sum_for_L;
        endfor
        % Compute U (upper triangular matrix)
        for j = (p + 1) : n
            sum_for_U = L(p, 1 : (p - 1)) * U(1 : (p - 1), j);
            U(p, j) = (A(p, j) - sum_for_U) / L(p, p);
        endfor
    endfor
    
    % At this point, we have A = L * U
    % To solve the system A * x = b, we replace A with the found decomposition
    % L * (U * x) = b
    % L * y = b => y (SIT)
    % U * x = y => x (SST)
    
    % Solve the lower triangular system (L, b)
    y = SIT(L, b);
    % Solve the upper triangular system (U, y)
    x = SST(U, y);
  
endfunction
