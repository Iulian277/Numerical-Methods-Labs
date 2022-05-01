% [ABOUT]
%       This function is used for integrating a given function `f`
%       on a certain interval [a, b], using the Romberg Method.
% [INPUT] 
%       `f`     - Function to integrate
%       `a`     - Lower bound of the interval
%       `b`     - Upper bound of the interval
%       `n`     - Number of equidistant points
% [OUTPUT]
%       `aprox` - Value of the definite integral of `f` from `a` to `b`

function [aprox] = romberg(f, a, b, n)
    % Store only the last 2 rows from Romber's matrix for efficiency
    R = zeros(2, n);
    h = b - a;

    % Initial approximation using Simple Trapezoidal (between `a` and `b`)
    R(1, 1) = h / 2 * (f(a) + f(b));

    % Complete the "matrix" line by line
    for i = 2 : n
        % Trapezoids approximation without calling the function
        % This approximation makes the process faster
        x = [];
        for k = 1 : 2^(i-2)
          x(k) = a + (k - 1/2) * h;
        endfor 
        R(2, 1) = 1 / 2 * (R(1, 1) + h * sum(f(x(:))));

        % Richardson extrapolation
        for j = 2 : i
          R(2, j) = R(2, j - 1) + (R(2, j - 1) - R(1, j - 1)) / (4^(j-1) - 1);
        endfor

        % Halve the step 
        % => Double the order of the method
        % => Better approximation  
        h /= 2;

        % Update the first line from `R`
        R(1, :) = R(2, :);
    endfor
    
    aprox = R(2, n);
endfunction
