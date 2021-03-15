function [Y] = gen_data_function(x,a,f)

%evaluate x on function f
y = f(x);

%generate data set with bounded b rand adjustment, 
Y = a.*randn(1, length(x)) + y;

%produce data by changing with rand adjust

