function [ MAT1 ] = resize( MAT )
% function [ MAT1 ] = resize( MAT )
%  (Copyright) Hazoor Ahmad UET Taxila, Pakistan.
% This function removes extra rows if any due to repition of maximum
% capacity outage in first colums of MAT.
% 
sizx=size(MAT, 1);
mybool=1;
mybool0=1;
i=2;
j=1;
while mybool0==1 && j<(sizx)
if (MAT(j,1)==MAT(j+1,1))
mybool0=0;
end
if mybool0==1
j=j+1;
end
end
MAT1=zeros(j,3);
MAT1(1,1)=MAT(1,1);
MAT1(1,2)=MAT(1,2);
MAT1(1,3)=MAT(1,3);
while (mybool==1) && (i<=j)
if (MAT(i,1) > MAT(i-1,1))
MAT1(i,1)=MAT(i,1);
MAT1(i,2)=MAT(i,2);
MAT1(i,3)=MAT(i,3);
else
MAT1(i,1)=MAT(i,1);
MAT1(i,2)=MAT(i,2);
MAT1(i,3)=MAT(i,3);
mybool=0;
end
i=i+1;
end
end