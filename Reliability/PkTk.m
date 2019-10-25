function [ PkTk ] = PkTk( COT1, Lmax, Lmin )
% function [ PkTk ] = PkTk( COT1, Lmax, Lmin )
% (Copyright) Hazoor Ahmad UET Taxila, Pakistan.
% This Function calculates colums 4 and 5 of extended Capacity outage table
% for calculation of LOLP and LOLE of a power system.
PkTkSIZE=size(COT1);
PkTkSIZE=PkTkSIZE(1);
PkTk=zeros(PkTkSIZE,2);
for i=1 : PkTkSIZE
        if (COT1(PkTkSIZE,1)-COT1(i,1))>Lmax
            PkTk(i,1)=0;
          elseif (COT1(PkTkSIZE,1)-COT1(i,1))<Lmin
            PkTk(i,1)=100;
          else
           PkTk(i,1)=((COT1(PkTkSIZE,1)-COT1(i,1))-Lmax)*(100)/(Lmin-Lmax);
        end
        PkTk(i,2)=COT1(i,2)*PkTk(i,1);
    end
end

