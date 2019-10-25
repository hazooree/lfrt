%% Example 2.3 of Chapter 2 Load Foracasting
% 
% Developed By Hazoor Ahmad BSEE UET Lahore, MSEE UET Taxila, Pakistan.
% 
%% Example 2.3 Chapter Load Foracasting
% Energy Consumption and load factor of ten years of certain locality is
% 
% given. Make a forcast of energy for 1987. By proper choice of load factor
% 
% calculate the maximum demand.
% 
%% sr.#  YEAR  EnergyConsmp.(MWH)  Load Factor
% 
%    1     1976        7370               0.6
% 
%    2     1977        8030               0.6
% 
%    3     1978        8470               0.61
% 
%    4     1979        8800               0.61
% 
%    5     1980        9130               0.61
% 
%    6     1981        9360               0.61
% 
%    7     1982        9900               0.62
% 
%    8     1983        10340              0.61
% 
%    9     1984        10730              0.62
% 
%   10    1985        11330              0.61
%% Code 

x=[1 2 3 4 5 6 7 8 9 10];
y=[7370 8030 8470 8800 9130 9460 9900 10340 10730 11330];
L=[0.6 0.6 0.61 0.61 0.61 0.61 0.62 0.61 0.62 0.61];
%% (a)Determing Load Factor 
% 
% We have to determine Load Factor for 1987 so xgiven=12
% 
% x, L are first two input point vectors, and Type=1 for linear curve fitting
% 
% DataFitting(x,L,Type,xgiven)
xgiven=12;
LF=DataFitting(x,L,1,xgiven);
%% (b)Determing Energy Consumed 
% 
% We have to determine Energy Consumed for 1987 so xgiven=12
% 
% x, y are first two input point vectors, and Type=1 for linear curve fitting
% 
% DataFitting(x,y,Type,xgiven)
xgiven=12;
Energy=DataFitting(x,y,1,xgiven);
%% (C)Determing Maximum Demand  
% 
% We have to determine average maximum demand for 1987.
MD=Energy/8760/LF;
%% Output  
msgbox({strcat('The Load Factor is = ' , num2str(LF)) strcat('The Energy Consumed is = ' ,...
    num2str(Energy)) strcat('The Maximum Demand is = ' , num2str(MD)) })
