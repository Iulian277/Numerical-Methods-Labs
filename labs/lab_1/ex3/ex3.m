% [ABOUT]
%       Lab 1 - Exercise 3
% [INFO]
%       sum(matrix)   - returns the sum of each col
%       sum(matrix')  - returns the sum of each row
%       diag(matrix)  - returns the elements on the main diagonal
%       fliplr(array) - flips an array left to right
%       magic(n)      - creates an n-by-n magic square

function [is_magic] = ex3(filename)    
    % Read the matrix from the input file
    A = dlmread(filename);
    
    % Compare with vectorization
    % A = magic(100);
    % tic
    
    % Compute the cols and rows sum vector
    cols_sum = sum(A);
    rows_sum = sum(A');

    % Compute the diagonals sum
    first_diag_sum  = sum(diag(A));
    second_diag_sum = sum(diag(fliplr(A)));
    
    % Check if the matrix is `magic square`
    is_magic = 0;
    if      rows_sum == cols_sum && ...
            first_diag_sum == second_diag_sum && ...
            first_diag_sum == rows_sum(1)
        is_magic = 1;
    endif
    
    % toc
    
endfunction
