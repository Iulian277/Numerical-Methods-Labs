% [ABOUT]
%       This function is used for checking if a matrix A is diagonally dominant
%       Returns 1 if true, 0 otherwise

function [is_diag_dom] = isDiagonallyDominant(A)
  % Grab the dimensions
  [n n] = size(A);
  
  % Suppose it is diagonally dominant
  is_diag_dom = 1;
  
  % For each row
  for i = 1 : n
    % Compute the sum of absolute value of 
    % the elements on row i, except A(i, i)
    sum_of_row_except_diag_el = sum(abs(A(i, :))) - abs(A(i, i));
    
    % Check ~condition
    if abs(A(i, i)) < sum_of_row_except_diag_el
      is_diag_dom = 0;  
      break;
    endif
  endfor
  
endfunction
