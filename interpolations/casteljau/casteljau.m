% [ABOUT]
%       This function implements the Casteljau algorithm
% [INPUT] 
%       `x`  - OX coordinates of known points
%       `y`  - OY coordinates of known points
%       `t`  - Paramteric value (0 <= t <= 1)
% [OUTPUT]
%       `B`  - Bernstein's polynomial

function [B] = casteljau(x, y, t)
    % Grab the dimensions
    n = length(x);
    
    % Plot the initial points
    plot(x, y, 'r-o', "markersize", 5);
    hold on;
    axis([0.5, 4.5, 0.2, 2.1]);

    % Calculate the Bernstein polynomials
    for j = 1 : (n - 1)
        for i = 1 : (n - j) 
            x(i) = (1 - t) * x(i) + t * x(i + 1);
            y(i) = (1 - t) * y(i) + t * y(i + 1);
        endfor
        % Plot the recurring points which describe the Bernstein polynomials
        plot(x(1 : (n - j)), y(1 : (n - j)), 'b-o', 'markersize', 5);
    endfor

    % Generated  Bernstein polynomial
    B = [x(1) y(1)];
    
endfunction
