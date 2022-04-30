% [ABOUT]
%       This function is used for QR decomposition (A = Q * R),
%       using Givens rotation. After that, solves the upper triangular system
%       Returns the Q, R matrices and the solution of the initial system
%       Q - orthogonal, R - upper triangular
% [NOTE]
%       This script works only for square matrices A
% [USES] 
%       utils/SST.m

function [Q R x] = givens_(A, b)
    % Grab the dimensions
    [m n] = size(A);
    
    % Gt will be the final rotation matrix
    % Read the formula from right to left
    % Gt = G_{n-1}{m} * G_{n-2}{m-1} * ... * G_{1}{n} * ... * G_{1}{3} * G_{1}{2}
     Gt = eye(m);
     
     % Iterate through the elements below the main diagonal
     % For each row
     for k = 1 : (n - 1)
        % For each column (elements below main diagonal)
        for l = (k + 1) : m
          % Initialize the current Givens matrix for this step
          G = eye(m);
          
          % Calculate cos and sin (for each step)
          rho = sqrt(A(k, k)^2 + A(l, k)^2);
          c =   A(k, k) / rho;
          s = - A(l, k) / rho;
          
          % Modify the rotation matrix G
          G(k, k) = c;
          G(k, l) = -s;
          G(l, k) = s;
          G(l, l) = c;
          
          % Update the matrix A (insert a 0 at position (l, k))
          A = G * A;
           
          % Update the final rotation matrix Gt
          Gt = G * Gt;
        endfor
     endfor
     
     % The orthogonal matrix (Q) is the transpose
     % of the multiplication of all rotation matrices (Gt)
     Q = Gt';
     
     % A becomes the upper triangular matrix
     R = A;
     
     % At the end, solve the initial system
     % A * x = b; A = Q * R
     % Q * R * x = b
     % Multiply in the left Q^-1 = Q' (Q orthogonal)
     % R * x = Q' * b
     x = SST(R, Q' * b); 

endfunction
