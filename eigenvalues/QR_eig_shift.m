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
%       and we need to extract those complex eigenvalues from 2x2 blocks

function [eigenvalues steps] = QR_eig_shift(A, tol, max_iter)
    % Grab the dimensions
    [n m] = size(A);
    
    % Sanity check - martix is symmetric
    if ~issymmetric(A, eps)
        disp('The input matrix `A` should be symmetric!');
        eigs  = NaN;
        steps = NaN;
        return;
    endif
    
    % Index for `miu`
    i = 1;

    for steps = 1 : max_iter
        % Matrix `E` stores the coefficients of an characteristic polynomial
        % of degree 2 (it stores the lower-right corner 2x2 block from A) 
        E = [1
            -A(n, n)-A(n-1, n-1)
             A(n, n)*A(n-1, n-1)-A(n, n-1)^2];
        
        % Find the roots of E
        lambda = roots(E);

        % We have only the upper-left 2x2 block (A has become 2x2)
        if n == 2
            eigs(1) = lambda(1);
            eigs(2) = lambda(2);
            break;
        endif

        % Determine the closest eigenvalue to A(n, n)
        if abs(lambda(1) - A(n, n)) >= abs(lambda(2) - A(n, n))
            miu(i) = lambda(2);
        else
            miu(i) = lambda(1);
        endif
        
        % Apply QR decomposition on the matrix `A - miu(i) * eye(n)`
        [Q R] = qr(A - miu(i) * eye(n));

        % Calculate the new matrix, considering the shift
        A = R * Q + miu(i) * eye(n);
        
        % Got close to an eigenvalue
        if (abs(A(n, n-1)) < tol)
            eigs(n) = A(n, n);
            
            % Prune the last row and the last column of A
            A = A(1 : (n - 1), 1 : (n - 1));
            n--;
        endif
        
        % Increase the `miu` index
        i++;
    endfor

    % Return the eigenvalues as a column vector
    eigenvalues = eigs';
    
endfunction