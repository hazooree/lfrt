function [ COT1 ] = COT( N, C, FOR )
% function [ COT1 ] = COT( N, C, FOR )
%  (Copyright) Hazoor Ahmad UET Taxila, Pakistan.
% This function gives the capacity outage table for 'N' units of 'C'
% Capacity with every unit having an Forced outage rate of 'FOR'

COT1=zeros(N+1,3);
    for i=0 : N
        COT1(i+1,1)=i*C;
        COT1(i+1,2)=ncr(N,i)*FOR^(i)*((1-FOR)^(N-i));
        if i==0
            COT1(i+1,3)=1;
        else
            COT1(i+1,3)=COT1(i,3)-COT1(i,2);
        end
    
    end
end

