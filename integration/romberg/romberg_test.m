% [ABOUT]
%       This is a tester function for the Romberg method
% [USES]
%       intergration/romberg/romberg.m

function [] = romberg_test()
    % Display in long format (more digits of precision)
    format long;

    % Define a function, an interval of integration and number of intervals
    f = @(x) x .^2 .* log(x);
    a = 1;
    b = 1.5;
    n = 3;

    % Integrate using Romberg method
    printf('exact integral:         %.8f\n', quad(f, a, b));
    printf('romberg:                %.8f\n', romberg(f, a, b, n));

    % Restore the short format
    format short;
endfunction
