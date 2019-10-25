function [ COTR1 ] = COTCombine( varargin )
% function [ COTR1 ] = COTCombine( varargin )
% (Copyright) Hazoor Ahmad UET Taxila, Pakistan.
% This function combines two or three Capacity Outage Tables, also it
% combines and calculates their cummulative probabilities in column 3

if nargin == 2
    COT1 = varargin{1};
    COT2 = varargin{2};
    siz1   = size(COT1,1);
    siz2   = size(COT2,1);
    COTR= zeros(siz1*siz2,3);
    k=1;
    for i=1 : siz1
        for j=1 : siz2
        COTR(k,1)=COT1(i,1)+COT2(j,1);
        COTR(k,2)=COT1(i,2)*COT2(j,2);
          k=k+1;
        end
    end
COTR= exsort(COTR);
COTR1=addsimilar(COTR);
elseif nargin == 3
    COT1 = varargin{1};
    COT2 = varargin{2};
    COT3 = varargin{3};
    siz1   = size(COT1,1);
    siz2   = size(COT2,1);
    siz3   = size(COT3,1);
    COTR= zeros(siz1*siz2*siz3,3);
    k=1;
    for i=1 : siz1
        for j=1 : siz2
            for l=1:siz3
            COTR(k,1)=COT1(i,1)+COT2(j,1)+COT3(l,1);
            COTR(k,2)=COT1(i,2)*COT2(j,2)*COT3(l,2);
            k=k+1;
            end
        end
    end
   COTR= exsort(COTR);
   
COTR1=addsimilar(COTR);
 for i=0:size(COTR1,1)
    if i==0
            COTR1(i+1,3)=1;
        else
            COTR1(i+1,3)=COTR1(i,3)-COTR1(i,2);
    end
    end
else
    msgbox('----------------Unbalanced or Missing Inputs----------------','Unbalanced');
    error('Unbalanced or Missing Inputs: Kindly Type (doc COTCombine) for help.');
end
end