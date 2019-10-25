clc, clear
inputfilename = 'kskmeteo.xlsx';
outputfilename = 'Forecast.xlsx';
Data = xlsread(inputfilename,3,'D72:O132696');

for i=1:921
    x(:,:,i)=Data(1+(i-1)*144:(i-1)*144+144,:);
end

load net
LW = 1.0; % Line Width
MS = 10; % MArker Size
FS = 16; % Font Size
day_number = 600;
scalingfactor = 0.15;
forecast = scalingfactor* predict(net,reshape(x(:,:,day_number),144,12,1));
forecast1 = scalingfactor* predict(net,reshape(x(:,:,day_number),144,12,1));
ground_truth = x(:,1,day_number+1);
plot(forecast,'b','LineWidth',LW,'MarkerSize',MS)
hold on
plot(forecast1,'r','LineWidth',LW,'MarkerSize',MS)
xlabel('Time of the Day','FontName','Times New Roman','FontSize',FS);
ylabel('Irradiance (Watt/m^2)','FontName','Times New Roman','FontSize',FS);
legend('Focasted','Measured','Location','best');

