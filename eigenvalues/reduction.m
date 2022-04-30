% [ABOUT]
%       This function is used for reducing a matrix `A`
%         -> If A is not symmetric, then `A_mod` will be `upper Hessenberg`
%         -> If A is     symmetric, then `A_mod` will be `tridiagonal`
%       For each column of A (except the last one)
%         - Make zeros on the p-th column under the    (p + 1) element
%         - Make zeros on the p-th row to the right of (p + 1) element
% [INPUT] 
%       `A`     - Input matrix
% [OUTPUT]
%       `A_mod` - Modified matrix A, according to the rules described above

function [A_mod] = reduction(A)
    % Grab the dimensions
    [m n] = size(A);
    
    % Initialize reduced output matrix
    A_mod = A;

    for p = 1 : min(m - 1, n) - 1
        % Initialize Householder vector
        vp = zeros(m, 1);

        % Compute Householder vector
        vp((p + 1) : m) = A_mod((p + 1) : m, p);
        
        % Reflect the vector `v` on `e1`
        % "-" sign because we want to reflect explicitly on `e1`
        vp(p + 1) += -sign(A_mod(p + 1, p)) * norm(vp);

        % Calculate the p-th step reflector
        Hp = eye(m) - 2 * vp * vp' / (vp' * vp);
        % norm(vp) = sqrt(vp' * vp) => norm(vp)^2 = vp' * vp

        % Remove elements under the p-th pivot in A (make zeros)
        A_mod = Hp * A_mod * Hp';
    endfor

endfunction
