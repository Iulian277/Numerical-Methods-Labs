% [ABOUT]
%       This function is used for QR decomposition (A = Q * R),
%       using Householder transormation.
%       After that, solves the upper triangular system
%       Returns the Q, R matrices and the solution of the initial system
%       Q - orthogonal, R - upper triangular
% [NOTE]
%       This script works only for square matrices A
% [USES]
%       utils/SST.m

function [Q R x] = householder(A, b)
    % Grab the dimensions
    [m n] = size(A);
    
    % Initialize Q matrix
    Q = eye(m);

    % H will be the final Householder matrix
    % Read the formula from right to left
    % H = H_{min(m-1, n)} * ... * H_p * ... * H_2 * H1
    H = eye(m);
    
    % Iterate through every step for creating the upper triangular matrix
    for p = 1 : min(m - 1, n)
        % Initialize Householder vector
        vp = zeros(m, 1);
        
        % Compute Householder vector
        sigma_p = sign(A(p, p)) * norm(A(p : m, p));
        vp(p) = A(p, p) + sigma_p;
        vp((p + 1) : m) = A((p + 1) : m, p);
        
        % Calculate the p-th step reflector
        Hp = eye(m) - 2 * vp * vp' / (vp' * vp);
        % norm(vp) = sqrt(vp' * vp) => norm(vp)^2 = vp' * vp
        
        p
        % Remove elements under the p-th pivot in A
        A = Hp * A
        
        % Update the final Householder matrix
        H = Hp * H
    endfor
        
    % The orthogonal matrix (Q) is the transpose
    % of the multiplication of all householder matrices (Hp)
    Q = H';
    
    % A becomes the upper triangular matrix
    R = A;
    
    % At the end, solve the initial system
    % A * x = b; A = Q * R
    % Q * R * x = b
    % Multiply in the left Q^-1 = Q' (Q orthogonal)
    % R * x = Q' * b
    x = SST(R, Q' * b);
    
endfunction
