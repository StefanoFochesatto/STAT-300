function [r2_1, r2_2, reg_even,reg_cheby, std_error_1, 
          std_error_2, RMSE_1, RMSE_2] = GenerateSampleData(f,a,b,n,s)


 % This function takes a sampling function, an interval [a, b]
 % and a number of nodes s, and the number of experiments n. 
 % This function returns the data
 % values, y for a given x, such that y = f(x) +- norm(0,3).  
 % It also returns all the linear model structs in a cell
 % for each type of sampling, reg_even, reg_cheby. And it
 % returns all the relevant analysis data like r^2, RMSE,
 % and standard error. 



   r2_1 = [];
   r2_2 = [];
   
   reg_even = cell(1,n);
   reg_cheby = cell(1,n);
  
   std_error_1 = [];
   std_error_2 = [];
   
   RMSE_1 = [];
   RMSE_2 = [];

for i = 1:n
    x_1 = linspace(a,b,s);
    x_2 = chebypoint(a,b,s-1);
    x_1_isolated = setdiff(x_1, x_2);
    x_2_isolated = setdiff(x_2, x_1);
    x_intersect = intersect(x_1, x_2);
    y_intersect = gen_data(x_intersect,3,f);

    y_1_isolated = [gen_data(x_1_isolated,3,f)];
    y_2_isolated = [gen_data(x_2_isolated,3,f)];
    y_1 = sort([y_1_isolated, y_intersect]);
    y_2 = sort([y_2_isolated, y_intersect]);
    
    reg_1 = fitlm(x_1, y_1);
    reg_2 = fitlm(x_2, y_2);
    
    reg_even{i} = reg_1;
    reg_cheby{i} = reg_2;
   
    RMSE_1 = [RMSE_1, reg_even{1,i}.RMSE];  
    RMSE_2 = [RMSE_2, reg_cheby{1,i}.RMSE];
  
    std_error_1 = [std_error_1, reg_even{1,i}.Coefficients.SE(2)];
    std_error_2 = [std_error_2, reg_cheby{1,i}.Coefficients.SE(2)];
    
    r2_1 = [r2_1, reg_1.Rsquared.Ordinary];
    r2_2 = [r2_2, reg_2.Rsquared.Ordinary];

    end



end

