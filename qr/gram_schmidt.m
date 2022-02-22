% [ABOUT]
%       This function is used for QR decomposition (A = Q * R),
%       using the modified Gram Schmidt process
%       After that, solves the upper triangular system
%       Returns the Q, R matrices and the solution of the initial system
%       Q - orthogonal, R - upper triangular
% [USES] 
%       utils/SST.m

function [Q R x] = gram_schmidt(A, b)
    % Grab the dimensions
    [m n] = size(A);
    
    % Initialize result matrices
    Q = [];
    
    % For each column of A
    for k = 1 : n
        % Initialize q with the current column from A
        q = A(1 : m, k);
        
        % Keep a copy of q
        q_copy = q;
        
        % Compute the orthogonal vector q
        % Substract incrementally projections
        for j = 1 : (k - 1)
            % Compute the scalar product (projection)
            scalar_prod = sum(q_copy .* Q(:, j));
            
            % Create orthogonal vectors
            q = q - scalar_prod * Q(1 : m, j);
        endfor
        
        % Normalize the q vector
        q = q / norm(q);
        
        % Add it to the Q matrix
        Q = [Q q];
    endfor
    
    % Now, we have: A = Q * R => R = Q^-1 * A = Q' * A
    % The upper triangular matrix will be Q' * A
    R = Q' * A;
     
    % At the end, solve the initial system
    % A * x = b; A = Q * R
    % Q * R * x = b
    % Multiply in the left Q^-1 = Q' (Q orthogonal)
    % R * x = Q' * b
    x = SST(R, Q' * b);

endfunction
