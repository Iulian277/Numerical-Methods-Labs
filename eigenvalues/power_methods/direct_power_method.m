% [ABOUT]
%       This function is used for calculating the largest eigenvalue
%       and the characteristic vector, using the Direct Power Method
% [INPUT] 
%       `A`        - Input matrix
%       `x0`       - Initial approximation of the dominant eigenvector
%       `tol`      - Imposed tolerance
%       `max_iter` - Maximum number of iterations
% [OUTPUT]
%       (eigenvalue, eigenvector) dominant pair of the matrix A
%       Number of executed steps

function [lambda x steps] = direct_power_method(A, x0, tol, max_iter)
    % Initialize some variables
    prev_x = x0;
    steps = 0;
    
    % Iterate to the maximum number of iterations
    for step = 1 : max_iter
        % Update the eigenvector (and normalize it)
        x = A * prev_x;
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
    endfor

endfunction
