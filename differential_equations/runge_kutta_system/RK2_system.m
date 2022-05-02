% [ABOUT]
%       This function is used for solving a system of 2 ODE of first order,
%       using the Runge-Kutta method of 2nd order.
% [INPUT] 
%       `f1`    - dy1/dt = f1(t, y1, y2)
%       `f2`    - dy2/dt = f2(t, y1, y2)
%       `y1_0`  - Initial condition for `y1`
%       `y2_0`  - Initial condition for `y2`
%       `a`     - Lower bound of the approximation interval
%       `b`     - Upper bound of the approximation interval
%       `n`     - Number of equidistant points (number of steps)
% [OUTPUT]
%       `y1`, `y2` - Approximated values of functions `y1` and `y2`

function [y1 y2] = RK2_system(f1, f2, y1_0, y2_0, a, b, n)
    % Initial conditions
    y1(1) = y1_0;
    y2(1) = y2_0;

    % Step
    h = (b - a) / n;

    % Generate equidistant points in the interval [a, b]
    for i = 0 : n
        t(i + 1)= a + i * h;
    endfor

    % Succesive approximation of `y1` and `y2` function values
    for i = 1 : n
        K11 = h * f1(t(i), y1(i), y2(i));
        K21 = h * f2(t(i), y1(i), y2(i));

        K12 = h * f1(t(i) + h, y1(i) + K11, y2(i) + K21);
        K22 = h * f2(t(i) + h, y1(i) + K11, y2(i) + K21);

        y1(i + 1) = y1(i) + (K11 + K12) / 2;
        y2(i + 1) = y2(i) + (K21 + K22) / 2;
    endfor
    
endfunction
