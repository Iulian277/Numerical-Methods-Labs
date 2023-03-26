% [ABOUT]
%       This function is used to illustrate the rotation
%       of a vector in 2D space, using a rotation matrix

function [] = rotate_vector(x)
    % Rotate vector in 2D
    angle = (10 * pi) / 180;

    % Rotation matrix
    c = cos(angle);
    s = sin(angle);
    G = [c -s; s c];

    % Plot the initial vector in blue
    clf;
    n = max(x);
    axis([-2 * n, 2 * n, -2 * n, 2 * n]);
    hold on;
    plot([0 x(1)],[0 x(2)], 'b');
    pause(1);

    % Plot in red the rotated vectors
    iters = 18;
    while iters > 0
        x = G * x;
        plot([0 x(1)],[0 x(2)], 'r');
        pause(1);
        iters--;
    endwhile

    % Release the plot
    hold off;
endfunction
