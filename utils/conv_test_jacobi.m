% [ABOUT]
%       This function is used for checking if
%       Jacobi iterative method converges or not
%       Returns 1 if converges, 0 otherwise
% [INFO]
%       N  = D (eg.: diag(A))
%       A  = N - P [P = L + U]
%       Gj = inv(N) * P 

function [converg] = conv_test_jacobi(A)
    % Suppose it converges
    converg = 1;
    
    % Create a diagonal matrix with the diagonal elements of A
    N = diag(diag(A));
    
    % Compute P in terms of A and N
    P = N - A;
    
    % Iteration matrix
    Gj = inv(N) * P;
    
    % Calculate the spectral radius of Gj
    spectral_rad = max(abs(eig(Gj)));
    
    % Check if the algorithm converges
    if spectral_rad >= 1 + eps
        converg = 0;
        return;
    endif
    
endfunction
