% [ABOUT]
%       This function checks if a given matrix has the Schur form
% [INPUT] 
%       `A`     - Input matrix
% [OUTPUT]
%       `schur` - 1 if the matrix `A` has the Schur form, 0 otherwise

function [schur] = is_schur(A)
    % Suppose the matrix has the Schur form with the tolerance `tol`
    schur = 1;
    tol   = 1e-3;
    
    % For each diagonal `element`, check the condition 
    for i = 1 : length(A) - 1
        if (abs(A(i)) > tol) && (abs(A(i + 1)) > tol)
          schur = 0;
          return;
        endif
    endfor

endfunction