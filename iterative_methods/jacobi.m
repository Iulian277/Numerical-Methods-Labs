% [ABOUT]
%       This function is used for solving a linear system (A * x = b),
%       using Jacobi iterative method.
%       Returns the solution of the initial system (x)
% [USES] 
%       utils/conv_test_jacobi.m

function [x step] = jacobi(A, b, x0, tol, max_iter)
    % Check if Jacobi algorithm converges
    if conv_test_jacobi(A) == 0
        disp('Matrix does not converge!');
        x = NaN;
        step = -1;
        return;
    endif
    
    % Grab the dimensions
    [m n] = size(A);
    
    % Set current approximation
    x_curr = x0;
    
    % Iterate to the maximum number of iterations
    for step = 1 : max_iter
        % Iterate through every x_next(i)
        for i = 1 : n
            % Compute the sum a_ij * xj_curr, j=1:n (except j=i)
            full_sum   = A(i, :) * x_curr(:);
            except_val = A(i, i) * x_curr(i);
            
            % Compute x_{k+1}
            x_next(i) = b(i) - (full_sum - except_val);
            x_next(i) = x_next(i) / A(i, i);
        endfor
        
        % Check if we reached the solution
        if norm(x_next - x_curr) < tol
            break;
        endif
        
        % Update the last computed values with the new values
        x_curr = x_next;
    endfor
    
    % Return value
    x = x_next';
        
endfunction
