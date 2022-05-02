% [ABOUT]
%       This is a tester for comparing the `Predictor-Corrector` method.
% [USES]
%       differential_equations/runge_kutta/RK4.m
%       differential_equations/predictor_corrector/predictor_corrector.m

function [] = predictor_corrector_test()
    % Differential equation has the form: y' = f(t, y)

    % Define a function and the exact solution
    f       = @(t, y) -y + e^(-t);
    y_exact = @(t) t .* e.^(-t);
    
    % Initial conditions
    y0 = 0;
    
    % Solving interval [a, b] and number of subintervals
    a = 0;
    b = 3;
    n = 100;

    y_rk4 = RK4(f, y0, a, b, n);
    y_pred_corr = predictor_corrector(f, y0, a, b, n);

    % Generate some points
    t = linspace(a, b, n + 1);
    
    % Plot the graphs
    plot(
        t, y_exact(t), 'g',
        t, y_rk4, '.', 'markersize', 10,
        t, y_pred_corr, '.', 'markersize', 10
        );
      
    legend('y(t)', 'RK4', 'Pred-Corr');

endfunction
