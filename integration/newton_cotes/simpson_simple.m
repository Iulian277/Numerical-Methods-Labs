% [ABOUT]
%       This function is used for integrating a given function `f`
%       on a certain interval [a, b], using the Simple Simpson Rule.
%       Perform a quadratic interpolation between `f(a)` and `f(b)`.
% [INPUT] 
%       `f`     - Function to integrate
%       `a`     - Lower bound of the interval
%       `b`     - Upper bound of the interval
% [OUTPUT]
%       `aprox` - Value of the definite integral of `f` from `a` to `b`

function [aprox] = simpson_simple(f, a, b)
    % Step (2 intrevals)
    h = (b - a) / 2;

    % Apply the formula
    aprox = h / 3 * (
                     f(a)               +
                     4 * f((a + b) / 2) +
                     f(b)
                     );
endfunction
