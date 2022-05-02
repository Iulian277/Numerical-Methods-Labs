% [ABOUT]
%       This function is used for solving an ODE of first order,
%       using the `Explicit Adams-Bashforth` method of 3rd order.
%       Adams-Bashforth's method creats a interpolation polynomial
%       between those 3 points and approximates `y_next` (which is outside
%       the interpolation range). Therefore, it makes an `extrapolation`
%       based on the last 3 given values (it "anticipates" the `y_next` value).
% [INPUT]
%       `y_curr`  - Current approximation
%       `h`       - Step
%       `f_n`, `f_n_1`, `f_n_2`
%                 - Values of function `f` in the last 3 points
% [OUTPUT]
%       `y_next`  - `Predicted` value of function `y` at next step

function [y_next] = adams_bashforth(y_curr, h, f_n, f_n_1, f_n_2)
  y_next = y_curr + h * (23/12 * f_n - 4/3 * f_n_1 + 5/12 * f_n_2);
endfunction
