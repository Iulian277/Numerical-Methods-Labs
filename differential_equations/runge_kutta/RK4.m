% [ABOUT]
%       This function is used for solving an ODE of first order,
%       using the Runge-Kutta method of 4th order.
%       We can look at `t` as being the OX value and `y` the function (OY).
% [INPUT]
%       `f`     - dy/dt = f(t, y)
%       `y0`    - Initial condition
%       `a`     - Lower bound of the approximation interval
%       `b`     - Upper bound of the approximation interval
%       `n`     - Number of equidistant points (number of steps)
% [OUTPUT]
%       `y`     - Approximated values of function `y` in the points from [a, b]
% [NOTE]
%       RK4 is prefered in practice (more details below)
%       https://en.wikipedia.org/wiki/Runge–Kutta_methods#The_Runge–Kutta_method

function [y] = RK4(f, y0, a, b, n)
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
        K1 = h * f(t(i)        , y(i));
        K2 = h * f(t(i) + h / 2, y(i) + K1 / 2);
        K3 = h * f(t(i) + h / 2, y(i) + K2 / 2);
        K4 = h * f(t(i) + h, y(i) + K3);

        y(i + 1) = y(i) + (K1 + 2 * K2 + 2 * K3 + K4) / 6;
    endfor

endfunction
