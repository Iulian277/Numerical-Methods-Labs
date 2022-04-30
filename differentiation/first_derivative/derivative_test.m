% [ABOUT]
%       This is a tester for comparing different methods of differentiation
% [USES]
%       differentiation/first_derivative/two_points.m
%       differentiation/first_derivative/three_point_mid.m
%       differentiation/first_derivative/three_point_end.m

function [] = derivative_test()
    % Some points
    x0 = [1 : 0.5 : 5];
    
    % Function f
    f  = @(x) sin(x);
    
    % Function derivative (df/dx)
    df = @(x) cos(x);

    % Iterate through points and call each function
    best_method = zeros(1, 3);
    for i = 1 : length(x0)
        % Exact value of the derivative in point x0(i)
        deriv(i) = df(x0(i));

        % Approximative values of the derivative in point x0(i)
        df_two_point(i)       = two_point(f, x0(i));
        df_three_point_mid(i) = three_point_mid(f, x0(i));
        df_three_point_end(i) = three_point_end(f, x0(i));

        printf('point:             %d\n', x0(i));
        printf('exact derivative:  %d\n', deriv(i));
        printf('two_points:        %d\n', df_two_point(i));
        printf('three_points_mid:  %d\n', df_three_point_mid(i));
        printf('three_points_end:  %d\n', df_three_point_end(i));
        printf('\n');
    endfor

    best_method(1) = norm(df_two_point       - deriv);
    best_method(2) = norm(df_three_point_mid - deriv);
    best_method(3) = norm(df_three_point_end - deriv);
    best_method'

    [best idx] = min(best_method); 
    printf('Best method - For the current function - Method number %d\n', idx);
    
endfunction
