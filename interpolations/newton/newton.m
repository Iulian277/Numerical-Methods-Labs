% [ABOUT]
%       This function performs the Newton Interpolation
% [INPUT] 
%       `x`  - OX coordinates of known points
%       `y`  - OY coordinates of known points
% [OUTPUT]
%       `P`  - Coefficients of the Newton polynomial
% [INFO]
%       poly(x(k))   - returns a polynomial of degree 1 with the root `x(k)`
%       conv(p1, p2) - multiplies 2 polynomials and returns the result

function [P] = newton(x, y)  
    % Convert `x` to column vector
    [n m] = size(x);
        if (n == 1)
        x = x';
        n = m;
    endif

    % Convert `y` to column vector
    [p q] = size(y);
        if (p == 1)
        y = y';
        p = q;
    endif

    % Compute divided differences
    D = zeros(n, n);
    D(:, 1) = y;
    for j = 2 : n
        for i = j : n
          D(i, j) = (D(i, j - 1) - D(i - 1, j - 1)) / (x(i) - x(i - j + 1));
        endfor
    endfor
    % D

    % Construct Newton's polynomial
    P = [];
    P = D(n, n);
    for k = (n - 1) : -1 : 1
        P = conv(P, poly(x(k)));
        m = length(P);
        P(m) = P(m) + D(k, k);
    endfor
    
endfunction