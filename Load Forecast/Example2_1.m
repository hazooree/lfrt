%% Example 2.1 of Chapter 2 Load Foracasting
% 
% Developed By Hazoor Ahmad BSEE UET Lahore, MSEE UET Taxila, Pakistan.
% 
%% Example 2.1 Chapter Load Foracasting
% The record of maximum demand of a system is given below. Extrapolate the 
% 
% average trend to determine the average maximum demand for 1987.
% 
%% Sr.#--------YEAR----------Max. Demand(MW)
% 
%    1       1976        1250
% 
%    2       1977        1300
% 
%    3       1978        1400
% 
%    4       1979        1450
% 
%    5       1980        1550
% 
%    6       1981        1640
% 
%    7       1982        1730
% 
%    8       1983        1840
% 
%    9       1984        1950
% 
%    10      1985        2060
%
%% Code 
% 
x=[1 2 3 4 5 6 7 8 9 10];
y=[1250 1300 1400 1450 1550 1640 1730 1840 1950 2060];
% We have to determine average maximum demand for 1987 so xgiven=12
% x, y are first two input point vectors, and Type=1 for linear curve fitting
% DataFitting(x,y,Type,xgiven)
xgiven=12;
%% Output  
msgbox(strcat('The Linear Curve Fitting result is = ' , num2str(DataFitting(x,y,1,xgiven))))