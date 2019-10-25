function [ MATR ] = exsort( MAT )
% function [ MATR ] = exsort( MAT )
% (Copyright) Hazoor Ahmad UET Taxila, Pakistan.
% This function sorts the first column of the Capacity Outage Table and
% also expands its sort on second and third values of every element of
% first column. Hence, this should include (n x 3) matrix
sizx = size(MAT,1);
for i =1 : sizx-1
    for j = 1 : sizx-1
        if (MAT(j,1)>MAT(j+1,1))
            temp1=MAT(j,1);
            temp2=MAT(j,2);
            temp3=MAT(j,3);
            MAT(j,1)=MAT(j+1,1);
            MAT(j,2)=MAT(j+1,2);
            MAT(j,3)=MAT(j+1,3);
            MAT(j+1,1)=temp1;
            MAT(j+1,2)=temp2;
            MAT(j+1,3)=temp3;
        end
    end
end
MATR=MAT;
end
