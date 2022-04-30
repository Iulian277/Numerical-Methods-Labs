% [ABOUT]
%       This function performs a Natural Cubic Spline Interpolation
% [INPUT] 
%       `x`  - OX coordinates of known points
%       `y`  - OY coordinates of known points
%       `x0` - Unknown point
% [OUTPUT]
%       `y0` - Value of the unknown point `x0` after interpolation
% [USES]
%       utils/SST.m
%       utils/SIT.m
%       interpolations/spline_c2_natural/lu_crout_3diag.m

function [y0] = splineC2_natural(x, y, x0)
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

    % We need to solve a linear system A * x = b, where A - 3diag

    % Set the length of the intervals: h(i) = x(i+1) - x(i)
    h(1: (n - 1)) = x(2 : n) - x(1 : (n - 1));

    % Set the splines' coefficients
    a(1 : n) = y(1 : n);

    % Set the coefficients for the vector (g) of free variables
    g(1) = 0;
    g(n) = 0;
    for i = 2 : (n - 1)
        g(i) = 3 / h(i) * (a(i + 1) - a(i)) - 3 / h(i - 1) * (a(i) - a(i - 1));
    endfor

    % dd - subdiagonal
    dd(1 : n - 2) = h(1 : (n - 2));
    dd(n-1) = 0;

    % aa - main diagonal
    aa(1) = 1;
    aa(n) = 1;
    for i = 2 : (n - 1)
        aa(i) = 2 * (h(i - 1) + h(i));
    endfor

    % cc - superdiagonal
    cc(1) = 0;
    cc(2 : (n - 1)) = h(2 : (n - 1));

    % Solve the system A * x = b (A - 3diag)
    A = diag(dd, -1) + diag(aa) + diag(cc, 1);
    [L U] = lu_crout_3diag(dd, aa, cc);

    % Compute the coefficients for each spline in `c`
    c = SST(U, SIT(L, g));

    % Compute the remaining coefficients (b(i), d(i)) for each spline
    for i = 1 : (n - 1)
        % For `d`, use the relation: c(j+1) = c(j) + 3*d(j)*h(j)
        d(i) = (c(i + 1) - c(i)) / (3 * h(i));
        % For `b`, use the relation: b(j+1) = b(j) + 2*c(j)*h(j) + 3*d(j)*h(j)^2
        b(i) = (a(i + 1) - a(i)) / h(i) - ((2 * c(i) + c(i + 1)) * h(i)) / 3;
    endfor

    % Determine the subinterval [x(i), x(i+1)] in which `x0` falls 
    for i = 1 : n-1
        if((x(i) <= x0) && (x0 <= x(i + 1)))
            % Apply the formula
            y0 =  a(i)                 ...
                + b(i) * (x0 - x(i))   ...
                + c(i) * (x0 - x(i))^2 ...
                + d(i) * (x0 - x(i))^3;
            break;
        endif
    endfor
  
endfunction
