% [ABOUT]
%       This is a tester function for Second Derivative Midpoint Formula
% [USES]
%       differentiation/second_derivative/three_point_second.m

function [] = derivative_second_test()
    % Some points
	x0 = [1 : 0.5 : 5];
    
    % Function f
	f   = @(x) sin(x);
    
    % Function second derivative (d2f/dx2)
	d2f = @(x) -sin(x);
	
    % Iterate through points and call each function
	for i = 1 : length(x0)
        % Exact value of the second derivative in point x0(i)
		deriv(i) = d2f(x0(i));

        % Approximative values of the second derivative in point x0(i)
		d2f_three_point(i) = three_point_second(f, x0(i));
    
        printf('point:                   %d\n', x0(i));
        printf('exact second derivative: %d\n', deriv(i));
        printf('three_points:            %d\n', d2f_three_point(i));
        printf('\n');
	endfor
    
endfunction
