% [ABOUT]
%       This function performs a Linear Interpolation given a set
%       of points (x, y) and find the value of an unknown point `x0`
% [INPUT] 
%       `x`  - OX coordinates of known points
%       `y`  - OY coordinates of known points
%       `x0` - Unknown point
% [OUTPUT]
%       `y0` - Value of the unknown point `x0` after interpolation

function [y0] = linear(x, y, x0)
    % Convert `x` to column vector
    [n m] = size(x);
    if (n == 1)
        x = x';
        n = m;
    endif

    % Convert `y` to column vector
    [p q] = size(y);
    if (p == 1)
        y = y';
        p = q;
    endif

    % Sort the points by the X-coordinates
    [sortedX sortIndex] = sort(x);
    sortedY = y(sortIndex);
    x = sortedX;
    y = sortedY;

    % `a` and `b` are the coeficients of the linear splines
    a = [];
    b = [];
    
    % Calculate the coeficients and the value `y0` only when the
    % point `x0` is between 2 known points 
    for i = 1 : (n - 1)
        if (x0 >= x(i)) && (x0 <= x(i + 1))
          % Calculate coeficients
          a(i) = (y(i + 1) - y(i)) / (x(i + 1) - x(i));
          b(i) = (x(i + 1) * y(i) - x(i) * y(i + 1)) / (x(i + 1) - x(i));
          % Calculate `y0` (value of `x0`)
          y0 = a(i) * x0 + b(i);
        endif
    endfor
    
endfunction
