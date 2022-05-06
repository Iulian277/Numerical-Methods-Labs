% [ABOUT]
%       This function is used for calculating the smallest eigenvalue
%       and the characteristic vector, using the Inverse Power Method
% [INPUT] 
%       `A`        - Input matrix
%       `x0`       - Initial approximation of the smallest eigenvector
%       `tol`      - Imposed tolerance
%       `max_iter` - Maximum number of iterations
% [OUTPUT]
%       (eigenvalue, eigenvector) least dominant pair of the matrix A
%       Number of executed steps
% [USES] 
%       utils/SST.m

function [lambda x steps] = inverse_power_method(A, x0, tol, max_iter)
    % Initialize some variables
    prev_x = x0;
    steps = 0;
    
    % Decompose the matrix A
    [Q R] = qr(A);
    
    % We need to solve x = inv(A) * prev_x <=> A * x = prev_x
    % Iterate to the maximum number of iterations
    for steps = 1 : max_iter
        % Update the eigenvector (and normalize it)
        y = Q' * prev_x;
        x = SST(R, y);
        x = x / norm(x);
        
        % Update the eigenvalue
        lambda = x' * A * x;
        
        % Check if we reached the solution
        if norm(x - prev_x) < tol
          break;
        endif
        
        % Move to the next step
        prev_x = x;
    endfor

endfunction
