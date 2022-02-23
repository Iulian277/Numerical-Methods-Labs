% [ABOUT]
%       This function is used for solving a linear system (A * x = b),
%       using the SOR iterative method.
%       Returns the solution of the initial system (x)

function [x step] = sor(A, b, x0, tol, max_iter, w)
    % Check if relaxation factor is inside (0, 2)
    if w <= 0 || w >= 2
        disp('w should be inside (0, 2)');
        step = -1;
        x = NaN;
        return;
    endif
    
    % Grab the dimensions
    [m n] = size(A);
    
    % Set current approximation
    x_curr = x0;
    x_next = x0;
    
    % Iterate to the maximum number of iterations
    for step = 1 : max_iter
        % Iterate through every x_next(i)
        for i = 1 : n
            % Compute the `next_sum` a_ij * xj_next, j=1:(i-1)
            next_sum = A(i, 1 : i - 1) * x_next(1 : i - 1);
            
            % Compute the `curr_sum` a_ij * xj_curr, j=(i+1):n
            curr_sum = A(i, i + 1 : n) * x_curr(i + 1 : n);
           
            % Compute x_{k+1} (Gauss-Seidel solution)
            x_next(i) = b(i) - next_sum - curr_sum;
            x_next(i) = x_next(i) / A(i, i);
            
            % Introduce the relaxation parameter
            x_next(i) = x_next(i) * w + x_curr(i) * (1 - w);
        endfor
        
        % Check if we reached the solution
        if norm(x_next - x_curr) < tol
            break;
        endif
        
        % Update the last computed values with the new values
        x_curr = x_next;
    endfor
    
    % Return value
    x = x_next;
        
endfunction
