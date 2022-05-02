% [ABOUT]
%       Lab 1 - Exercise 1

function [] = ex1(filename)
    % Open the file
    open_mode = 'w';
    fid = fopen(filename, open_mode);
    if fid < 1
        disp(["Couldn't open the file `", ...
        filename, "` in `", open_mode, "` mode!"]);
        return;
    endif
    
    % Interval and step
    a = 0;
    b = 1;
    step = 0.1;
    
    % Without vectorization
    tic
    for x = a : step : b
        fprintf(fid, "x=%f y=%f\n", x, 2 * x + 1);
    endfor
    toc
    
    % With vectorization
    tic
    x = a : step : b;
    y = 2 * x + 1;
    fprintf(fid, "x=%f y=%f\n", x, y);
    toc
    
    % Close the file
    fclose(fid);
  
endfunction
