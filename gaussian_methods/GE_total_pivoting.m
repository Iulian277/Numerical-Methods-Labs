% [ABOUT]
%       This function is used for solving a linear system (A * x = b),
%       using Gaussian elimination with total pivoting
%       Returns the solution (x) of the initial system
% [INFO]
%       max(matrix)  - returns first maximum el for each col and its row idx
%       max(matrix') - returns first maximum el for each row and its col idx
% [NOTE]
%       This script works only for non-singular matrices
% [USES]
%       utils/SST.m

function [x] = GE_total_pivoting(A, b)
    % Number of rows (equations)
    n = length(b);

    % Build the augmented matrix (ro: matrice extinsa)
    % so we do less operations (do all operations at once)
    A_ext = [A b];

    % Build the permutation vector
    % This algorithm swap columns (and rows)
    perm = [1 : n];

    % For each row
    for p = 1 : (n - 1)
        % Find the abs max el from submatrix
        % A_ext(p:n, p:n) and use it as a pivot
        [pivot, pivot_line] = max(abs(A_ext(p : n, p : n)));
        [pivot, pivot_column] = max(pivot);
        pivot_line = pivot_line + p - 1;
        pivot_line = pivot_line(pivot_column);
        pivot_column = pivot_column + p - 1;

        % Swap the lines (move pivot on diagonal position)
        temp_line = A_ext(p, :);
        A_ext(p, :) = A_ext(pivot_line, :);
        A_ext(pivot_line, :) = temp_line;

        % Swap the columns (move pivot on diagonal position)
        temp_column = A_ext(:, p);
        A_ext(:, p) = A_ext(:, pivot_column);
        A_ext(:, pivot_column) = temp_column;

        % Update the permutation vector
        temp_perm = perm(p);
        perm(p) = perm(pivot_column);
        perm(pivot_column) = temp_perm;

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

    % Apply the permutation vector to the solution
    x = x(perm);

endfunction
