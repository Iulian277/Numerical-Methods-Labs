% [ABOUT]
%       This function is used for integrating a given function `f`
%       on a certain interval [a, b], using the Simple Trapezoidal Rule.
%       Perform a linear interpolation between `f(a)` and `f(b)`,
%       then approximate the integral with the area of the trapezoid.
% [INPUT] 
%       `f`     - Function to integrate
%       `a`     - Lower bound of the interval
%       `b`     - Upper bound of the interval
% [OUTPUT]
%       `aprox` - Value of the definite integral of `f` from `a` to `b`

function [aprox] = trapezoidal_simple(f, a, b)  
    % Step (1 intreval)
    h = b - a;
    
    % Apply the formula
    aprox = h / 2 * (f(a) + f(b));
endfunction
