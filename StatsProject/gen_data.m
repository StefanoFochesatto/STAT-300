 function [y_1, y_2] = Generate_Sample_Data(f,a,b,s)
 % This function takes a sampling function, an interval [a, b]
 % and a number of nodes s. This function returns the data
 % values, y for a given x, such that y = f(x) +- norm(0,3).  
 
    % Generates s, evenly spaced points on [a,b]
    x_1 = linspace(a,b,s);

    % Generates s, chebyshev spaced points on [a,b]
    x_2 = chebypoint(a,b,s-1);
 
    % Set Theory logic to ensure each sample point generates data once
    x_1_isolated = setdiff(x_1, x_2);
    x_2_isolated = setdiff(x_2, x_1);
    x_intersect = intersect(x_1, x_2);
    y_intersect = gen_data_function(x_intersect,3,f);
    y_1_isolated = [gen_data_function(x_1_isolated,3,f)];
    y_2_isolated = [gen_data_function(x_2_isolated,3,f)];
    
    % Return each data value separatly and in asending order
    y_1 = sort([y_1_isolated, y_intersect]);
    y_2 = sort([y_2_isolated, y_intersect]);

end