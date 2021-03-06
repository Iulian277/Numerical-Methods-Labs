% [ABOUT]
%       This function performs a Vandermonde Interpolation
% [INPUT] 
%       `x`  - OX coordinates of known points
%       `y`  - OY coordinates of known points
% [OUTPUT]
%       `P`  - Coefficients of the Vandermonde polynomial
% [USES]
%       utils/SST.m

function [P] = vandermonde(x, y)
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

    % Construct Vandermonde's matrix `A`
    A = vander(x);

    % Construct vector's coefficients
    P = zeros(n, 1);

    % Solve the linear system A * P_coef = y 
    [Q R] = qr(A);
    z = Q' * y;
    P = SST(R, z);
    
endfunction
