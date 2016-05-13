function p = poly_fit()

    x = linspace(1,90,90);
    y = zeros(1,90);
    for i = x
        y(i) = polarizer(1,x(i));
    end

    p = polyfit(x,y,2)

    