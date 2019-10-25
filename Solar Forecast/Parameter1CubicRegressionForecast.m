% Cubic Regression
% Hourly Data of GHIrsi (W/m²) average
clc, clear
filename = 'Updated_Forecast_Data.xlsx';
Data10Min = xlsread(filename,1);
DataHwrly = xlsread(filename,2);
Ten_Mins = 144;
One_Hwrs = 24;
Day1_10 = Data10Min(0*Ten_Mins+1:1*Ten_Mins,6:18);
Day3_10 = Data10Min(1*Ten_Mins+1:2*Ten_Mins,6:18);
Day4_10 = Data10Min(2*Ten_Mins+1:3*Ten_Mins,6:18);
Day5_10 = Data10Min(3*Ten_Mins+1:4*Ten_Mins,6:18);
Day6_10 = Data10Min(4*Ten_Mins+1:5*Ten_Mins,6:18);
Day7_10 = Data10Min(5*Ten_Mins+1:6*Ten_Mins,6:18);
Day8_10 = Data10Min(6*Ten_Mins+1:7*Ten_Mins,6:18);
Day9_10 = Data10Min(7*Ten_Mins+1:8*Ten_Mins,6:18);
Day1_1h = DataHwrly(0*One_Hwrs+1:1*One_Hwrs,4:16);
Day3_1h = DataHwrly(1*One_Hwrs+1:2*One_Hwrs,4:16);
Day4_1h = DataHwrly(2*One_Hwrs+1:3*One_Hwrs,4:16);
Day5_1h = DataHwrly(3*One_Hwrs+1:4*One_Hwrs,4:16);
Day6_1h = DataHwrly(4*One_Hwrs+1:5*One_Hwrs,4:16);
Day7_1h = DataHwrly(5*One_Hwrs+1:6*One_Hwrs,4:16);
Day8_1h = DataHwrly(6*One_Hwrs+1:7*One_Hwrs,4:16);
Day9_1h = DataHwrly(7*One_Hwrs+1:8*One_Hwrs,4:16);
x=[1 3 4 5 6 7 8 9];
xgiven = 2;
for i=1:13
    y = [Day1_10(:,i) Day3_10(:,i) Day4_10(:,i) Day5_10(:,i) Day6_10(:,i) Day7_10(:,i) Day8_10(:,i) Day9_10(:,i)];
    yrequired(:,i) = CubicRegression(x,y,xgiven);
end
xlswrite('forecastday2.xlsx',yrequired,1,'B4:N147')
clear yrequired
for i=1:13
    y = [Day1_1h(:,i) Day3_1h(:,i) Day4_1h(:,i) Day5_1h(:,i) Day6_1h(:,i) Day7_1h(:,i) Day8_1h(:,i) Day9_1h(:,i)];
    yrequired(:,i) = CubicRegression(x,y,xgiven);
end
xlswrite('forecastday2.xlsx',yrequired,2,'B4:N27')
clear yrequired
for j=1:9
    xgiven = 9+j;
    for i=1:13
        y = [Day1_10(:,i) Day3_10(:,i) Day4_10(:,i) Day5_10(:,i) Day6_10(:,i) Day7_10(:,i) Day8_10(:,i) Day9_10(:,i)];
        yrequired(:,i) = CubicRegression(x,y,xgiven);
    end
    xlswrite(strcat('June',num2str(xgiven),'.xlsx'),yrequired,1,'B4:N147')
end
clear yrequired
for j=1:9
    xgiven = 9+j;
    for i=1:13
        y = [Day1_1h(:,i) Day3_1h(:,i) Day4_1h(:,i) Day5_1h(:,i) Day6_1h(:,i) Day7_1h(:,i) Day8_1h(:,i) Day9_1h(:,i)];
        yrequired(:,i) = CubicRegression(x,y,xgiven);
    end
    xlswrite(strcat('June',num2str(xgiven),'.xlsx'),yrequired,2,'B4:N27')
end