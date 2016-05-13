function p = poly_fit()

    % Fit a second order polynomial that models the behavior of 
    % a polarizer. 
    
    % Theta is the angle of polarizer. Output is equal to input
    % when angle is 0 degrees and minimum when angle is 90 degrees.

    
    x = linspace(1,90,90);
    y = zeros(1,90);
    for i = x
        y(i) = polarizer(1,x(i));
    end

    p = polyfit(x,y,2);

    