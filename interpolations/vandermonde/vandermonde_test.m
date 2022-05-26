% [ABOUT]
%       This is a tester function for Vandermonde Interpolation
% [USES]
%       interpolations/vandermonde/vandermonde.m 

function [] = vandermonde_test()
    % Interpolation support (n = number of known points in the base)
    n = 15;
    % n = 100;
    % n random points in the range [-10, 10] x [-10, 10]
    x = (rand(1, n) - 0.5) * 20;
    y = (rand(1, n) - 0.5) * 20;

    % Generate the Vandermonde interpolation polynomial
    P = vandermonde(x, y);

    % Verficare conditii polinom de interpolare
    % Check if the resulted polynomial `P` is a good one
    % The numerical instability of the system can cause bad results
    for i = 1 : length(x)
        if ((polyval(P, x(i)) - y(i)) > 1e-2)
          disp('Vandermonde polynomial does not respect the conditions!');
          break; % However, let's plot the graph
          % return;
        endif
    endfor

    % Generate 100 points in the range [min(x), max(x)]
    xx = linspace(min(x), max(x));
    
    % Evaluate the polynomial `P` in each of these 100 points
    yy = polyval(P, xx);

    % Plot the polynomial
    plot(xx, yy);
    hold on;

    % Plot the known points from interpolation base
    plot(x, y, 'o');
    hold off;

    legend('Vandermonde', 'Known points');

endfunction