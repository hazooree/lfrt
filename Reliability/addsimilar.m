function [ MATR ] = addsimilar ( MAT )
% function [ MATR ] = addsimilar ( MAT )
% (Copyright) Hazoor Ahmad UET Taxila, Pakistan.
% This function add similar adds the values of first column of MAT that are
% similar also their multiplies their corresponding probability in column 2
sizx = size(MAT,1);
for k=1:(sizx-1)
    for i =1 : (sizx-1)
        for j = 1 : (sizx-1)
            if (MAT(j,1)==MAT(j+1,1))
                MAT(j,2)=MAT(j,2) + MAT(j+1,2);
                MAT(j+1,1)=MAT(sizx,1);
                MAT(j+1,2)=0;
                MAT=exsort(MAT);
               %MAT=MAT(1:(sizx-1),:);
                %sizx=sizx-1;
             end
        end
    end
end
MATR=MAT;
end