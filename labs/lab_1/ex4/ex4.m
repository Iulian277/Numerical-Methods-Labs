% [ABOUT]
%       Lab 1 - Exercise 4
% [NOTE]
%       You can use the `dd` command in linux
%       for creating a file of given size (e.g.: file of 256kb)
%       dd if=/dev/urandom of=256kb_file count=1 bs=256k

function [filesize] = ex4(filename)
    % Open the file
    open_mode = 'r';
    fid = fopen(filename, open_mode);
    if fid < 1
        disp(["Couldn't open the file `", ...
        filename, "` in `", open_mode, "` mode!"]);
        filesize = -1;
        return;
    endif
    
    % Determine the size of file
    fseek(fid, 0, 'eof');
    filesize = ftell(fid); % bytes
    filesize /= 1024;      % kilo-bytes
    
    % Close the file
    fclose(fid);
    
endfunction
