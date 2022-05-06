% [ABOUT]
%       This function calculates the eigenvalues of a given matrix A
% [INPUT] 
%       `A`        - Input matrix
%       `tol`      - Imposed tolerance
%       `max_iter` - Maximum number of iterations
% [OUTPUT]
%       Eigenvalues of the matrix A
%       Number of executed steps
% [NOTE]
%       This script works only for symmetric matrices A
%       If the matrix is asymmetric, then at the end of the algorithm,
%       the matrix will have the Schur form (it will have complex eigenvalues)

function [eigenvalues steps] = QR_alg(A, tol, max_iter)
    % Grab the dimensions
    [n m] = size(A);

    % Sanity check - Martix should be symmetric
    if ~issymmetric(A, eps)
        disp('The input matrix `A` should be symmetric!');
        eigenvalues  = NaN;
        steps        = NaN;
        return;
    endif
    
    % Reduce the matrix `A` to tridiagonal form
    A_curr = reduction(A);
    
    for steps = 1 : max_iter
        % Decompose the matrix `A`
        [Q R] = qr(A_curr);
        
        % Update the matrix `A`
        % Q * R  = A_curr => R = Q' * A_curr
        % A_next = R * Q  => A_next = Q' * A_curr * Q (similarity transformation)
        A_next = R * Q;
        
        % Check if we reached the solution
        if norm(diag(A_next) - diag(A_curr)) < tol
            break;
        endif
        
        % Move to the next step
        A_curr = A_next;
    endfor
    
    % Grab the eigenvalues from the transformed matrix
    eigenvalues = diag(A_curr);
    
endfunction
