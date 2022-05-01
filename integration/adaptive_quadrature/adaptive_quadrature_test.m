% [ABOUT]
%       This is a tester function for Adaptive Quadrature
% [USES]
%       intergration/adaptive_quadrature/adaptive_simpson.m

function [] = adaptive_quadrature_test()
    % Display in long format (more digits of precision)
    format long;

    % Define a function, an interval of integration
    % and the tolerance of the approximation
    f   = @(x) sin(x .* exp(x));
    a   = -pi / 17;
    b   =  pi / 7;
    tol = 1e-5;

    % Integrate using Adaptive Quadrature method
    printf('exact integral:         %.8f\n', quad(f, a, b));
    printf('adaptive_simpson:       %.8f\n', adaptive_simpson(f, a, b, tol));
    
    % Restore the short format
    format short;
endfunction
