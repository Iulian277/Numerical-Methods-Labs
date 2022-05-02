% [ABOUT]
%       Lab 1 - Exercise 5
% [INFO]
%       fgetl   - reads the current line from file
%               - if there are no more characters to read, returns -1
%       strfind - search for `pattern` in the string
%               - returns the string index
% [NOTE]
%       You can test the script with inputs 'file.txt' and 'abc'
%       The output should be: 3 2 1, total=6

function [total_count] = ex5(filename, substring)
    % Open the file
    open_mode = 'r';
    fid = fopen(filename, open_mode);
    if fid < 1
        disp(["Couldn't open the file `", ...
        filename, "` in `", open_mode, "` mode!"]);
        total_count = -1;
        return;
    endif
    
    total_count = 0;
    % Traverse the file line by line
    line = fgetl(fid);
    while line != -1
        occ_vec = strfind(line, substring);
        occ_len = length(occ_vec);
        
        disp(occ_len)
        disp(line);
        
        total_count += occ_len;
        line = fgetl(fid);
    endwhile
    
    % Close the file
    fclose(fid);
  
endfunction
