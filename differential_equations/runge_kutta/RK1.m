% [ABOUT]
%       This function is used for solving an ODE of first order,
%       using the Runge-Kutta method of 1st order (also called Euler's method).
%       We can look at `t` as being the OX value and `y` the function (OY).
% [INPUT]
%       `f`     - dy/dt = f(t, y)
%       `y0`    - Initial condition
%       `a`     - Lower bound of the approximation interval
%       `b`     - Upper bound of the approximation interval
%       `n`     - Number of equidistant points (number of steps)
% [OUTPUT]
%       `y`     - Approximated values of function `y` in the points from [a, b]

function [y] = RK1(f, y0, a, b, n)
    % Initial condition
    y(1) = y0;

    % Step (Euler Forward Step)
    h = (b - a) / n;

    % Generate equidistant points in the interval [a, b]
    for i = 0 : n
        t(i + 1)= a + i * h;
    endfor

    % Succesive approximation of `y` function values
    for i = 1 : n
        y(i + 1) = y(i) + h * f(t(i), y(i));
    endfor

endfunction
