% Cubic Regression
% Hourly Data of GHIrsi (W/m²) average
clc, clear
inputfilename = 'kskmeteo.xlsx';
outputfilename = 'Forecast.xlsx';
Data = xlsread(inputfilename,3,'C72:O132696');


Xgiven = xlsread(outputfilename,1,'C2:C200000');
x=Data(:,1);
for j=1:200
    xgiven = Xgiven(j);
    for i=1:12
        y = Data(:,i+1)';
        yrequired(1,i) = CubicRegression(x,y,xgiven);
    end
    xlswrite(strcat('Forecast.xlsx'),yrequired,1,strcat('D',num2str(j+1),':O',num2str(j+1)))
end

