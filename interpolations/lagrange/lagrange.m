% [ABOUT]
%       This function performs a Lagrange Interpolation
% [INPUT] 
%       `x`  - OX coordinates of known points
%       `y`  - OY coordinates of known points
%       `x0` - Unknown point
% [OUTPUT]
%       `y0` - Value of the unknown point `x0` after interpolation

function [y0] = lagrange(x, y, x0)
    % Initialize the result `y0`
    y0 = 0;
    
    % Calculate Lagrange's multiplier
    L = ones(length(x), 1);
    
    % Calculate Lagrange's polynomial
    for i = 1 : length(x)
        % Calculate the Lagrange multiplier
        for j = 1 : length(x)
          if(i != j)
            L(i, :) = L(i, :) .* ((x0 - x(j)) / (x(i) - x(j)));
          endif
        endfor

        % Update `y0` value
        y0 = y0 + y(i) * L(i, :);
    endfor
    
endfunction
