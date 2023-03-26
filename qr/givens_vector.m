% [ABOUT]
%       This function is used to perform the Givens algorithm
%       to a given vector x and 2 indices k and l (column
%       and line index in the vector - k should by 1)
% [NOTE]
%       This algorithm introduces a zero at the (l, k) index
%       and modifies only the (k, k) element
% [EXAMPLE]
%   x = [1 2 3 4 5]'
%   x = givens_vector(x, 1, 2)
%   x = givens_vector(x, 1, 3)
%   x = givens_vector(x, 1, 4)
%   x = givens_vector(x, 1, 5)

function [x] = givens_vector(x, k=1, l)
    % Calculate `cos` and `sin`
    r = sqrt(x(k)^2 + x(l)^2);
    c =  x(k) / r;
    s = -x(l) / r;

    % Construct the Givens matrix (G_kl)
    [n m] = size(x);
    G = eye(n);
    G(k, k) =  c;
    G(k, l) = -s;
    G(l, k) =  s;
    G(l, l) =  c;

    % Apply the Givens transformation
    % This will introduce a zero at the (k, l) index
    % in the given vector `x`
    x = G * x;
end
