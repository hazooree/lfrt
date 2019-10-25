function [ ncr ] = ncr( n, r )
%  [ ncr ] = ncr( n, r )
%  (Copyright) Hazoor Ahmad UET Taxila, Pakistan.
% This function calculates the no of combinations of an 'n' given 'r'.
ncr = factorial(n)/factorial(r)/factorial(n-r);
end
