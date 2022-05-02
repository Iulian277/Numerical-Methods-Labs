% [ABOUT]
%       This function is used for solving an ODE of
%       first order, using a `Predictor-Corrector` method.
%       We use `Adams-Bashforth` for `prediction` and
%              `Adams-Moulton`   for `correction`.
% [INPUT] 
%       `f`     - dy/dt = f(t, y)
%       `y0`    - Initial condition
%       `a`     - Lower bound of the approximation interval
%       `b`     - Upper bound of the approximation interval
%       `n`     - Number of equidistant points (number of steps)
% [OUTPUT]
%       `y` - Approximated values of function `y` in the points from [a, b]
% [USES]
%       differential_equations/predictor_corrector/adams_bashforth.m
%       differential_equations/predictor_corrector/adams_moulton.m

function [y] = predictor_corrector(f, y0, a, b, n)
    % Initial condition (first point)
    y(1) = y0;

    % Approximations for second and third point, using `RK4`
    y_values = RK4(f, y0, a, b, n);
    y(2) = y_values(2);
    y(3) = y_values(3);

    % Step
    h = (b - a) / n;

    % Generare puncte echidistante in [a, b]
    for i = 0 : n
        t(i + 1)= a + i * h;
    endfor

    % Succesive approximation in each point
    for i = 3 : n
        f_n   = f(t(i),     y(i));     % f_n
        f_n_1 = f(t(i - 1), y(i - 1)); % f_(n-1)
        f_n_2 = f(t(i - 2), y(i - 2)); % f_(n-2)
        
        % Predict y_(i+1) with Adams-Bashforth
        y_pred = adams_bashforth(y(i), h, f_n, f_n_1, f_n_2);

        % Correct y_(i+1) with Adams-Moulton
        f_next = f(t(i+1), y_pred); % f_(n+1)
        y_corr = adams_moulton(y(i), h, f_next, f_n, f_n_1, f_n_2);
        
        % Prediction -> Correction -> Approximated value `y(i + 1)`
        y(i + 1) = y_corr;
    endfor
    
endfunction
