% [ABOUT]
%       This is a tester for comparing different
%       intergration methods of type Newton-Cotes
% [USES]
%       intergration/newton_cotes/trapezoidal_simple.m
%       intergration/newton_cotes/trapezoidal_composite.m
%       intergration/newton_cotes/simpson_simple.m
%       intergration/newton_cotes/simpson_composite.m

function [] = newton_cotes_test()
    % Display in long format (more digits of precision)
    format long;

    % Define a function, an interval of integration and number of intervals
    f = @(x) x .^2 .* log(x);
    a = 1;
    b = 1.5;
    n = 3;
    
    % Integrate using different Newton-Cotes methods
    printf('exact integral:         %.8f\n', quad(f, a, b));
    printf('trapezoidal_simple:     %.8f\n', trapezoidal_simple(f, a, b));
    printf('trapezoidal_composite:  %.8f\n', trapezoidal_composite(f, a, b, n));
    printf('simpson_simple:         %.8f\n', simpson_simple(f, a, b));
    printf('simpson_composite:      %.8f\n', simpson_composite(f, a, b, n));
    
    % Restore the short format
    format short;
endfunction
