% [ABOUT]
%       This function performs a Lagrange Interpolation
% [INPUT] 
%       `x`  - OX coordinates of known points
%       `y`  - OY coordinates of known points
%       `x0` - Unknown point
% [OUTPUT]
%       `y0` - Value of the unknown point `x0` after interpolation

function [y0] = lagrange(x, y, x0)
    % Grab the dimensions
    n = length(x);
    
    % Initialize the result `y0`
    y0 = 0;
    
    % Calculate Lagrange's multiplier
    L = ones(n, 1);
    
    % Calculate Lagrange's polynomial
    for i = 1 : n
        % Calculate the Lagrange multiplier
        for k = 1 : n
          if(i != k)
            L(i, :) = L(i, :) .* ((x0 - x(k)) / (x(i) - x(k)));
          endif
        endfor

        % Update `y0` value
        y0 = y0 + y(i) * L(i, :);
    endfor
    
endfunction
