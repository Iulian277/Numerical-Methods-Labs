% [ABOUT]
%       This function is used for solving a linear system (A * x = b),
%       using Gaussian elimination.
%       Returns the solution (x) of the initial system
% [NOTE]
%       This script works only for non-singular matrices
%       All the diagonal elements (pivots) must not be zero
% [USES]
%       utils/SST.m

function [x] = gaussian_elimination(A, b)
    % Number of rows (equations)
    n = length(b);

    % Build the augmented matrix (ro: matrice extinsa)
    % so we do less operations (do all operations at once)
    A_ext = [A b];

    % For each row
    for p = 1 : (n - 1)
        % Check if the pivot is 0
        if abs(A_ext(p, p)) < eps
            disp('One of the pivots is 0!');
            x = NaN;
            return;
        endif

        % Gaussian elimination (line operations)
        for i = (p + 1) : n
            % Compute gaussian multiplier
            miu = A_ext(i, p) / A_ext(p, p);

            % Update the current i-th row (line)
            % Line_i = Line_i - a_ip/a_pp * Line_p
            A_ext(i, :) = A_ext(i, :) - miu * A_ext(p, :);
        endfor
    endfor

    % Split back A_ext in A and b
    A = A_ext(:, 1 : n);
    b = A_ext(:, n + 1);

    % A is now an upper triangular matrix
    x = SST(A, b);

endfunction
