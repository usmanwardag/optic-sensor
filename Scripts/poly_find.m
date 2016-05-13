function y = poly_find(x, theta)
    
    % Using the fitted polynomial, estimate the output
    % value.

    p = poly_fit();
    y = x * ((p(1) * theta^2) - (p(2) * theta) + p(3));