% [ABOUT]
%       This is a tester for comparing different
%       methods of solving ODEs of first order.
% [USES]
%       differential_equations/runge_kutta/RK1.m
%       differential_equations/runge_kutta/RK2.m
%       differential_equations/runge_kutta/RK4.m

function [] = RK_test()
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

    y_rk1 = RK1(f, y0, a, b, n);
    y_rk2 = RK2(f, y0, a, b, n);
    y_rk4 = RK4(f, y0, a, b, n);

    % Generate some points
    t = linspace(a, b, n + 1);
    
    % Plot the graphs
    plot(
        t, y_exact(t), 'g',
        t, y_rk1, '.', 'markersize', 10,
        t, y_rk2, '.', 'markersize', 10,
        t, y_rk4, '.', 'markersize', 10
        );
      
    legend('y(t)', 'RK1 (Euler)', 'RK2', 'RK4');

endfunction
