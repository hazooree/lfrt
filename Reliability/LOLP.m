%% Loss of Load Probability
%  (Copyright) Hazoor Ahmad BSEE UET Lahore, MSEE UET Taxila, Pakistan.
%
%% Function
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
%% Code
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