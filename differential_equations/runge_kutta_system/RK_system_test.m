% [ABOUT]
%       This is a tester for comparing different
%       methods of solving ODEs of first order.
% [USES]
%       differential_equations/runge_kutta_system/RK1_system.m
%       differential_equations/runge_kutta_system/RK2_system.m
%       differential_equations/runge_kutta_system/RK4_system.m

function [] = RK_system_test()
    % The system of 2 different equations has the following form:
    % y'_1 = f1(t, y1, y2)
    % y'_2 = f2(t, y1, y2)

    % Define the functions and the exact solutions    
    f1 = @(t, y1, y2) y1 - y2 + 2;
    f2 = @(t, y1, y2) -y1 + y2 + 4 * t;
    
    y1_exact = @(t) (-1 / 2) * e .^ (2 * t) + t .^ 2 + 2 * t - 1 / 2;
    y2_exact = @(t) (+1 / 2) * e .^ (2 * t) + t .^ 2         - 1 / 2;    
    
    % Initial conditions
    y1_0 = -1;
    y2_0 =  0;
    
    % Solving interval [a, b] and number of subintervals
    a = 0;
    b = 1;
    n = 10;

    [y1_rk1 y2_rk1] = RK1_system(f1, f2, y1_0, y2_0, a, b, n);
    [y1_rk2 y2_rk2] = RK2_system(f1, f2, y1_0, y2_0, a, b, n);
    [y1_rk4 y2_rk4] = RK4_system(f1, f2, y1_0, y2_0, a, b, n);

    % Generate some points
    t = linspace(a, b, n + 1);
    
    % Plot the graphs
    plot(
        t, y1_exact(t), 'r', t, y2_exact(t), 'r',
        t, y1_rk1, 'g', t, y2_rk1, 'g',
        t, y1_rk2, 'b', t, y2_rk2, 'b',
        t, y1_rk4, 'c', t, y2_rk4, 'c'
        );
      
    legend(
        'y1(t)', 'y2(t)',
        'y1 RK1', 'y2 RK1',
        'y1 RK2', 'y2 RK2',
        'y1 RK4', 'y2 RK4'
        );

endfunction
