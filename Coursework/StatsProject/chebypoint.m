function [x] = chebypoint(a,b,n)
% This function takes an interval [a,b],
% and the number of desired chebyshev points
% and returns the chebyshev points normalized
% on the interval [a,b]. 
x = [];
    
    for i = 0:n
        x = [x, cos(pi+((pi*i)/n))];
    end
x = ((b - a)/2).*x + (a + (b - a)/2);
end
