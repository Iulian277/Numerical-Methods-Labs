% [ABOUT]
%       This function is used for differentiating a given function `f`
%       at a certain point `x0`, using the Three-Point Endpoint Formula
% [INPUT] 
%       `f`   - Function
%       `x0`  - Point to find the derivative at
% [OUTPUT]
%       `df`  - Value of f' at the point x0: f'(x0)

function [df] = three_point_end(f, x0)
   % Step (x1 = x0 + h)
   h = 0.01;
   
   % Apply the formula
   df = (-3 * f(x0) + 4 * f(x0 + h) - f(x0 + 2 * h)) / (2 * h);
endfunction
