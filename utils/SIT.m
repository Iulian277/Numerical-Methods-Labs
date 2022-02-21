% [USAGE]
%       This function solves a lower triangular system (L * x = b)
% [INFO]
%       If the matrix is not lower triangular, we cannot solve the system
%       So, we need to check if all the elements above the main diagonal are 0
%
%       triu(A, 1)  - returns what is strictly above the main diagonal
%       abs(matrix) - returns the same matrix, but each element in module
%       max(matrix) - returns a list of every column's max
%       max(list)   - returns the maximum from the list
% [NOTE] 
%       There is a function called `istril(A)` which returns 1 if A is a
%       lower triangular matrix but it doesn't catch the e-16 errors
%       which should be ignored

function [x] = SIT(A, b)
    % Check if input matrix (A) is lower triangular
    if max(max(abs(triu(A, 1)))) > 10^3 * eps
        disp('The matrix A is not lower triangular!');
        x = NaN;
        return;
    endif

    % Grab the dimensions
    [n n] = size(A);
    
    % Initialize the solution vector with zeros (x)
    x = zeros(n, 1);

    % Calculate x(i) forwards
    for i = 1 : 1 : n
        sum_of_xs = A(i, 1 : (i - 1)) * x(1 : (i - 1));
        x(i) = (b(i) - sum_of_xs) / A(i, i);
    endfor
    
endfunction
