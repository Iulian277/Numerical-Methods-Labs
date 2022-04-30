% [ABOUT]
%       This function is used for checking if a matrix A is positive definite
%       Returns 1 if true, 0 otherwise
% [USES]
%       utils/is_diagonally_dominant.m

function [is_pos_def] = is_positive_definite(A)
    % Grab the dimensions
    [n n] = size(A);

    % Suppose it is positive definite
    is_pos_def = 1;

    % A is positive definite if:
    % - it is diagonally dominant
    % - A(i, i) > 0
    % - A is symmetrical
    if is_diagonally_dominant(A) == 1 && diag(A) > 0 && issymmetric(A)
        return;
    endif

    % A can be positive definite with Sylvester theorem
    % A is positive definite <=> All principal minors are positive
    for i = 1 : n
        % Current principal minor
        B = A(1 : i, 1 : i);

        % Check ~condition
        if det(B) < 0
            is_pos_def = 0;
            break;
        endif
    endfor
    
endfunction
