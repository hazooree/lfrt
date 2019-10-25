x=[1 2 3 4 5 6 7 8 9 10];
y=[1250 1300 1400 1450 1550 1640 1730 1840 1950 2060];
xgiven=str2double(inputdlg('Enter The X for which you desire Y'));
msgbox({strcat('The Exponetial Curve Fitting result is = ' , num2str(DataFitting(x,y,0,xgiven))) strcat('The Linear Curve Fitting result is        = ', num2str(DataFitting(x,y,1,xgiven))) strcat('The Parabolic Curve Fitting result is   = ' , num2str(DataFitting(x,y,2,xgiven))) strcat('The S Curve Fitting result is               = ' , num2str(DataFitting(x,y,3,xgiven)))});