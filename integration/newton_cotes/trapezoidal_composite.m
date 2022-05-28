% [ABOUT]
%       This function is used for integrating a given function `f`
%       on a certain interval [a, b], using the Composite Trapezoidal Rule.
%       Applies Simple Trapezoidal Rule for each small interval (`n` in total),
% [INPUT] 
%       `f`     - Function to integrate
%       `a`     - Lower bound of the interval
%       `b`     - Upper bound of the interval
%       `n`     - Number of equidistant points
% [OUTPUT]
%       `aprox` - Value of the definite integral of `f` from `a` to `b`

function [aprox] = trapezoidal_composite(f, a, b, n)  
    % Step (n intrevals) and equidistant points
    h = (b - a) / n;
    x = (a + h) : h : (b - h);

    % Apply the formula
    aprox = h / 2 * (f(a) + f(b) + 2 * sum(f(x)));
endfunction
