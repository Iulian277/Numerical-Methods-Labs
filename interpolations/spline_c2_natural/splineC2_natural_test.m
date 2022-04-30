% [ABOUT]
%       This is a tester function for Natural C2 Spline Interpolation
% [USES]
%       interpolations/splineC2_natural/splineC2_natural.m 

function [] = splineC2_natural_test()
    % Interpolation support - Logo MN
    x = [0.526 1.617 2.583 3.550 4.547 5.389 ...
         6.387 7.384 8.382 9.286 10.315 11.344 12.217 12.996];
    y = [0.177 5.165 8.782 9.654 6.163 6.069 ...
         8.782 5.227 0.800 13.146 7.877 5.165 9.654 15.017];

    % Interpolation support - Duck
    % x = [0.9 1.3 1.9 2.1 2.6 3.0 3.9 4.4 4.7 5.0 ...
    %      6.0 7.0 8.0 9.2 10.5 11.3 11.6 12.0 12.6 13.0 13.3];
    % y = [1.3 1.5 1.85 2.1 2.6 2.7 2.4 2.15 2.05 ...
    %      2.1 2.25 2.3 2.25 1.95 1.4 0.9 0.7 0.6 0.5 0.4 0.25];

    % Generate 100 points in the range [min(x), max(x)]
    % and apply `Natural C2 Spline` interpolation
    xx = linspace(min(x), max(x));
    for i = 1 : 100
        yy(i) = splineC2_natural(x, y, xx(i));
    endfor

    % Plot the splines
    plot(xx, yy);
    hold on;

    % Plot the known points from interpolation base
    plot(x, y, 'o');
    hold off;

    legend('Natural C2 Spline', 'Known points');
    
endfunction
