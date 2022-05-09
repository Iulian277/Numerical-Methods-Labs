% [ABOUT]
%       This function is used to plot the binarized version of matrix A
%       Plot the non-zero elements
% [INPUT] 
%       `A`        - Input matrix
%       `tol`      - Imposed tolerance

function [] = plot_binarized_mat(A, tol = 1e-3)
    % Grab the dimensions
    [n m] = size(A);

    % Generate binarized matrix
    bin = [abs(A) > tol];
    
    % Generate points
    x = [];
    y = [];
    for i = 1 : m
        for j = 1 : n
            if bin(i, j) == 1
               x = [x i];
               y = [y n - j];
            endif
        endfor
    endfor
   
    % Plot the matrix
    scatter(x, y, 'filled');
    
endfunction
