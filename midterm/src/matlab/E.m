function y = E(f, x)
    y = 0;
    for i=1:length(x)
        y = y + x(i)*f(x(i)); % round to nearest integer
    end
end

