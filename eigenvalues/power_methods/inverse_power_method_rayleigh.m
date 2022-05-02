% [ABOUT]
%       This function is used for calculating the smallest eigenvalue
%       and the characteristic vector, using an accelerated version of the
%       Inverse Power Method, using the Rayleigh quotient
% [INPUT] 
%       `A`        - Input matrix
%       `alpha`    - Initial approximation of the smallest eigenvalue
%       `tol`      - Imposed tolerance
%       `max_iter` - Maximum number of iterations
% [OUTPUT]
%       (eigenvalue, eigenvector) least dominant pair of the matrix A
%       Number of executed steps
% [USES] 
%       utils/SST.m

function [lambda x steps] = inverse_power_method_rayleigh(A, alpha, tol, max_iter)
    % Grab the dimensions
    [n m] = size(A);
    
    % Check if we can 
    if issymmetric(A, eps)
        disp ('The `Rayleigh quotient` method will not be applied,
               because the input matrix is not symmetric!');
    endif
    
    % Initialize some variables
    prev_x = rand(n, 1);
    steps = 0;
    
    % Decompose the matrix A
    [Q R] = qr(A - alpha * eye(n));
    
    % We need to solve x = inv(A - alpha * eye(n)) * prev_x
    % Iterate to the maximum number of iterations
    for step = 1 : max_iter
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
        steps++;
        
        % Use the Rayleigh quotient if the matrix is symmetric
        if A == A'
            alpha = (x' * A * x) / (x' * x);
        endif
    endfor

endfunction
