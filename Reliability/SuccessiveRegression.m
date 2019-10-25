function [ yrequired ] = SuccessiveRegression( x, y, type, n )
yrequired = zeros(1,n);
for i=1:n
    yrequired(i) = DataFitting(x, y, type, n+i);
     x(i) = n+i;
     y(i) = yrequired(i);
end
end

