% [ABOUT]
%       Lab 1 - Exercise 2

function [] = ex2()
    % Read the input value 
    n = input('Enter a value: ')
    
    % Sanity check
    if n < 0
        disp('n should be positive!');
        return;
    endif
    
    % For loop
    tic
    odd_sum = 0;
    for i = 1 : 2 : n
        odd_sum += i;
    endfor
    odd_sum
    toc
    
    % While loop
    tic
    odd_sum = 0;
    i = 1;
    while i <= n
        odd_sum += i;
        i += 2;
    endwhile
    odd_sum
    toc
    
    % With vectorization
    tic
    % Compute a vector of odd numbers in range 1 : n
    odd_numbers = 1 : 2 : n;
    % Compute the sum
    odd_sum = sum(odd_numbers)
    toc
    
    
endfunction
