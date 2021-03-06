% [ABOUT]
%       This function is used for computing the second derivative
%       of a given function `f` at a certain point `x0`,
%       using the Second Derivative Midpoint Formula
% [INPUT] 
%       `f`   - Function
%       `x0`  - Point to find the second derivative at
% [OUTPUT]
%       `d2f` - Value of f'' at the point x0: f''(x0)

function [d2f] = three_point_second(f, x0)
    % Step (x1 = x0 + h)
    h = 0.01;
    
    % Apply the formula
    d2f = (f(x0 - h) - 2 * f(x0) + f(x0 + h)) / (h^2);
endfunction
