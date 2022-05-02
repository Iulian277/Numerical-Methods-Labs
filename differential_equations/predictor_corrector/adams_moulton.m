% [ABOUT]
%       This function is used for solving an ODE of first order,
%       using the `Implicit Adams-Bashforth` method of 3rd order.
%       This method is used as a `corrector`, given the current approximation.
%       Usually, this method is preceded by another method used as `predictor`.
% [INPUT]
%       `y_curr`  - Current approximation
%       `h`       - Step
%       `f_next`  - Approximation using a `predictor` earlier
%       `f_n`, `f_n_1`, `f_n_2`
%                 - Values of function `f` in the last 3 points
% [OUTPUT]
%       `y_next`  - `Corrected` value of function `y` at next step

function [y_next] = adams_moulton(y_curr, h, f_next, f_n, f_n_1, f_n_2)
    y_next = y_curr + ...
             h * (9/24 * f_next + 19/24 * f_n - 5/24 * f_n_1 + 1/24 * f_n_2);	
endfunction
