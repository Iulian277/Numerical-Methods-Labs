% [ABOUT]
%       This is a tester function for Linear Interpolation
% [USES]
%       interpolations/linear/linear.m 

function [] = linear_test()
    % Interpolation support (n = number of known points in the base)
    n = 7; 
    % n random points in the range [-10, 10] x [-100, 100]
    x = sort((rand(1, n) - 0.5) * 20);
    y = (rand(1, n) - 0.5) * 200;

    % Generate 100 points in the range [min(x), max(x)]
    % and apply `linear` interpolation
    xx = linspace(min(x), max(x));
    for i = 1 : length(xx)
        yy(i) = linear(x, y, xx(i));
    endfor

    % Plot the polynomial
    plot(xx, yy);
    hold on;

    % Plot the known points from interpolation base
    plot(x, y, 'o', 'markersize', 10);
    hold off;

    legend('Linear interpolation', 'Known points');
endfunction
