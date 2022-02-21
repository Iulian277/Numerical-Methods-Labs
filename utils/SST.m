% [USAGE]
%       This function solves an upper triangular system (U * x = b)
% [INFO]
%       If the matrix is not upper triangular, we cannot solve the system
%       So, we need to check if all the elements under the main diagonal are 0
%
%       tril(A, -1) - returns what is strictly under the main diagonal
%       abs(matrix) - returns the same matrix, but each element in module
%       max(matrix) - returns a list of every column's max
%       max(list)   - returns the maximum from the list
%
% [NOTE] 
%       There is a function called `istriu(A)` which returns 1 if A is an
%       upper triangular matrix but it doesn't catch the e-16 errors
%       which should be ignored

function [x] = SST(A, b)
    % Check if input matrix (A) is upper triangular
    if max(max(abs(tril(A, -1)))) > 10^3 * eps
        disp('The matrix A is not upper triangular!');
        x = NaN;
        return;
    endif

    % Grab the dimensions
    [n n] = size(A);
    
    % Initialize the solution vector with zeros (x)
    x = zeros(n, 1);

    % Calculate x(i) backwards
    for i = n: -1 : 1
        sum_of_xs = A(i, (i + 1) : n) * x((i + 1) : n);
        x(i) = (b(i) - sum_of_xs) / A(i, i);
    endfor
    
endfunction
