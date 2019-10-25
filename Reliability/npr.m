function [ npr ] = npr( n, r )
%   [ npr ] = npr( n, r )
%  (Copyright) Hazoor Ahmad UET Taxila, Pakistan.
% This function calculates the no of permutations of an 'n' given 'r'.
npr = factorial(n)/factorial(n-r);
end

