% [ABOUT]
%       This function applies the Singular Value Decomposition to a given matrix
% [INPUT] 
%       `A` - Input matrix
% [OUTPUT]
%       Matrices `U`, `S` and `V`, from SVD decomposition
%       A = U * S * V'
% [USES] 
%       qr/gram_schmidt.m

function [U S V] = svd_alg(A)
    % Grab the dimensions
    [m, n] = size(A);
    
    % Initialize the output matrices
    U = zeros(m, m);
    S = zeros(m, n);
    V = zeros(n, n);

    % Calculate the `V` matrix
    [vecp, valp]  = eig(A' * A);
    [valp, order] = sort(abs(diag(valp)), 'descend');
    vecp = vecp(:, order);
    V    = vecp;

    % Rows >= Columns
    if (m >= n)
        % Calculate matrix `S`
        s = sqrt(valp);
        S = [diag(s); zeros(m - n, n)];

        % Calculate columns 1 : n from matrix `U`
        i = 1;
        U(:, (1 : n)) = 1 / s(order(i++)) * A * vecp(:, (1 : n));

        % For calculating the columns (n + 1) : m from
        % matrix `U`, use Gram-Schmidt decomposition
        U(:, (n + 1) : m) = rand(m, m - n);
        [Q R] = gram_schmidt(U);
        U = Q;
    % Columns > Rows
    else 
        % Calculate matrix `S`
        s = sqrt(valp);
        S = [diag(s(1 : m)), zeros(m, n - m)];

        % Calculate columns 1 : n from matrix `U`
        i = 1;
        U(:, (1 : m)) = 1 / s(order(i++)) * A * vecp(:, (1 : n));

        % Applying the Gram-Schimdt procedure, we
        % accumulate in Q the orthonormal matrix `U`
        [Q R] = gram_schmidt(U);
        U = Q;
    end
  
endfunction
