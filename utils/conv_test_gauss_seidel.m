% [ABOUT]
%       This function is used for checking if
%       Gauss-Seidel iterative method converges or not
%       Returns 1 if converges, 0 otherwise
% [INFO]
%       A = N - P
%       N = D - L (eg.: tril(A))
%       P = U
%       Ggs = inv(N) * P 

function [converg] = conv_test_gauss_seidel(A)
    % Suppose it converges
    converg = 1;
    
    % Create a lower triangular matrix with the elements of A
    N = tril(A);
    
    % Compute P in terms of A and N
    P = N - A;
    
    % Iteration matrix
    Ggs = inv(N) * P;
    
    % Calculate the spectral radius of Gj
    spectral_rad = max(abs(eig(Ggs)));
    
    % Check if the algorithm converges
    if spectral_rad >= 1 + eps
        converg = 0;
        return;
    endif
    
endfunction
