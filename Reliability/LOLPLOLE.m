%% Loss of Load Probability
%  (Copyright) Hazoor Ahmad BSEE UET Lahore, MSEE UET Taxila, Pakistan.
%
%% Functions
function [ LOLP,Pk,Tk, PkTk1,xLOLP ] = LOLP( varargin )
%  [LOLP,Pk,Tk] = LOLP(N1,C1,FOR1,Lmax,Lmin)
%
%  [LOLP,Pk,Tk] = LOLP(N1,C1,FOR1,N2,C2,FOR2,Lmax,Lmin)
%
%  [LOLP,Pk,Tk] = LOLP(N1,C1,FOR1,N2,C2,FOR2,N3,C3,FOR3,Lmax,Lmin)
%
%  (Copyright) Hazoor Ahmad UET Taxila, Pakistan.
%
%  (Function Description)
%
%  LOLP Function is a Power System Reliability Index
%
%  More Specifically It is Used here for the determination of Reserve
%
%  Capacity of a Power System.
%
%  (Inputs)
%  This Function will use Number of Units along with their Generation
%
%  Capacities also it will need F.O.R. (Forced Outage Rate,Unavailability)
%
%  for every unit.
%
%  Additionally we will need the Extreme Values (Maximum & Minimum of
%
%  Expected Loads.
%
%  (Outputs)
%
%  >Function will return Just LOLP if just a single or no output is
%
%  demanded.
%
%  >If two outputs are demanded it will give first output LOLP and second
%
%  will be the array of Individual Probabilities.
%
%  >If Three outputs are demanded it will give you the values of  LOLP,
%
%  Individual Probability Array and Time Array.
%
%% LOLP.m Function
if nargin < 5
    msgbox('----------------Too Few Input Parameters----------------','Insufficient Data');
    error('Too Few Input Parameters: Kindly Enter Minimum of five.');
end
if nargin == 5
    N1     = varargin{1};
    C1     = varargin{2};
    FOR1   = varargin{3};
    Lmax   = varargin{4};
    Lmin   = varargin{5};
    COT1=COTab(N1,C1,FOR1)
     COTR1 = resize(COT1)
    COTR1(:,4:5)=PkTk(COTR1,Lmax,Lmin);
    LOLP=sum(COTR1(:,5));
    xLOLP=LOLP*365/100;
    Pk=COTR1(:,2);
    Tk=COTR1(:,4);
    PkTk1=COTR1(:,5);
elseif nargin == 8
    N1 = varargin{1};
    C1 = varargin{2};
    FOR1 = varargin{3};
    N2 = varargin{4};
    C2 = varargin{5};
    FOR2 = varargin{6};
    Lmax   = varargin{7};
    Lmin   = varargin{8};
    COT1 = COTab(N1,C1,FOR1);
    COT2 = COTab(N2,C2,FOR2);
    COTR = COTCombine(COT1,COT2);
    COTR1 = resize(COTR);
     COTR1(:,4:5)=PkTk(COTR1,Lmax,Lmin);
     LOLP=sum(COTR1(:,5));
    xLOLP=LOLP*365/100;
    Pk=COTR1(:,2);
    Tk=COTR1(:,4);
    PkTk1=COTR(:,5);
    elseif nargin == 11
    N1     = varargin{1};
    C1     = varargin{2};
    FOR1   = varargin{3};
    N2     = varargin{4};
    C2     = varargin{5};
    FOR2   = varargin{6};
    N3     = varargin{7};
    C3     = varargin{8};
    FOR3   = varargin{9};
    Lmax   = varargin{10};
    Lmin   = varargin{11};
    COT1 = COTab(N1,C1,FOR1);
    COT2 = COTab(N2,C2,FOR2);
    COT3 = COTab(N3,C3,FOR3);
    COTR = COTCombine(COT1,COT2,COT3);
    COTR1 = resize(COTR);
    COTR1(:,4:5)=PkTk(COTR1,Lmax,Lmin);
     LOLP=sum(COTR1(:,5));
    xLOLP=LOLP*365/100;
    Pk=COTR1(:,2);
    Tk=COTR1(:,4);
    PkTk1=COTR1(:,5);
else
    msgbox('----------------Unbalanced or Missing Inputs----------------','Unbalanced');
    error('Unbalanced or Missing Inputs: Kindly Type (doc LOLP) for help.');
end
end

%% COTab.m Function
function [ COT1 ] = COTab( N, C, FOR )
% function [ COT1 ] = COTab( N, C, FOR )
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

%% PkTk. Function

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

%% COTCombine.m Function
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

%% Add Similar Function
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

%% exsort.m Function
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

%% COT.m Function
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

%% resize.m Function
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
%% ncr.m Function
function [ ncr ] = ncr( n, r )
%  [ ncr ] = ncr( n, r )
%  (Copyright) Hazoor Ahmad UET Taxila, Pakistan.
% This function calculates the no of combinations of an 'n' given 'r'.
ncr = factorial(n)/factorial(r)/factorial(n-r);
end

%% npr.m
function [ npr ] = npr( n, r )
%   [ npr ] = npr( n, r )
%  (Copyright) Hazoor Ahmad UET Taxila, Pakistan.
% This function calculates the no of permutations of an 'n' given 'r'.
npr = factorial(n)/factorial(n-r);
end