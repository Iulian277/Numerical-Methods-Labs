% [ABOUT]
%       This function is used for integrating a given function `f`
%       on a certain interval [a, b], using Adaptive Quadrature.
% [INPUT] 
%       `f`     - Function to integrate
%       `a`     - Lower bound of the interval
%       `b`     - Upper bound of the interval
%       `tol`   - Tolerance of the approximation
% [OUTPUT]
%       `S` - Value of the definite integral of `f` from `a` to `b`

function [S] = adaptive_simpson(f, a, b, tol)
    % `c` is the middle of the interval [a, b]
    c = a + (b - a) / 2;
    
    % Simpson on the entire interval [a, b]
    S1 = simpson_simple(f, a, b);
    
    % Simpson on each half: [a, c] and [c, b]
    S2 = simpson_simple(f, a, c) + simpson_simple(f, c, b);

    % If the 4th derivative of `f` doesn't change a lot,
    % we can approximate the integral as follows
    if (abs(S2 - S1) < 15 * tol)
        S = S2 + (S2 - S1) / 15;
    else
        % Recursively call the `adaptive_simpson` function
        % if the function `f` changes a lot in the intreval [a, b]
        c = a + (b - a) / 2;
        S_left  = adaptive_simpson(f, a, c, tol/2);
        S_right = adaptive_simpson(f, c, b, tol/2);
        S = S_left + S_right;
    endif
    
endfunction
