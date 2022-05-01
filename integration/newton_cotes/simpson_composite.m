% [ABOUT]
%       This function is used for integrating a given function `f`
%       on a certain interval [a, b], using the Composite Trapezoidal Rule.
%       Applies Simple Simpson Rule for each small interval (`2n` in total),
% [INPUT] 
%       `f`     - Function to integrate
%       `a`     - Lower bound of the interval
%       `b`     - Upper bound of the interval
%       `n`     - Number of equidistant points
% [OUTPUT]
%       `aprox` - Value of the definite integral of `f` from `a` to `b`

function [aprox] = simpson_composite(f, a, b, n)
    % Step (2n intrevals) and equidistant points
    h = (b - a) / (2 * n);
    x = (a + h) : h : (b - h);

    % Apply the formula (vectorized form)
    aprox = h / 3 * (
                     f(a)                               +
                     f(b)                               +
                     4 * sum(f(x(1 : 2 : (2 * n - 1)))) +
                     2 * sum(f(x(2 : 2 : (2 * n - 1))))
                     );
endfunction
