% [ABOUT]
%       This is a tester function Casteljau algorithm
% [USES]
%       interpolations/casteljau/casteljau.m 

function [] = casteljau_test()
  
    clf;
    % Known points (interpolation base)
    x = [1  0.7  2.7  3.7];
    y = [0.5  2  2  0.5];

    % Bernstein polynomials
    i = 1;	
    B_x = zeros();
    B_y = zeros();

    % Parametric representation (0 <= t <= 1)
    for t = 0 : 0.1 : 1
        % Calculate the Bernstein polynomials
        bernstein = casteljau(x, y, t);
        B_x(i) = bernstein(1);
        B_y(i) = bernstein(2);

        % Plot the new point from the Bezier curve
        plot(B_x, B_y, 'r-*',  'markersize', 5);
        i++;
        
        pause(1);
        hold off; 
    endfor
    
endfunction
