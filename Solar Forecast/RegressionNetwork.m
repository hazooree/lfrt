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
X = 3:9;
Inp_10(:,:,:,1) = reshape(Day3_10,[144, 13, 1]);
Inp_10(:,:,:,2) = reshape(Day4_10,[144, 13, 1]);
Inp_10(:,:,:,3) = reshape(Day5_10,[144, 13, 1]);
Inp_10(:,:,:,4) = reshape(Day6_10,[144, 13, 1]);
Inp_10(:,:,:,5) = reshape(Day7_10,[144, 13, 1]);
Inp_10(:,:,:,6) = reshape(Day8_10,[144, 13, 1]);
Tar_10(:,1) = Day4_10(:,1);
Tar_10(:,2) = Day5_10(:,1);
Tar_10(:,3) = Day6_10(:,1);
Tar_10(:,4) = Day7_10(:,1);
Tar_10(:,5) = Day8_10(:,1);
Tar_10(:,6) = Day9_10(:,1);


layers = [
    imageInputLayer([144 13 1])
    
    convolution2dLayer(3,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    fullyConnectedLayer(144)
    regressionLayer];

options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',5, ...
    'Shuffle','every-epoch', ...
    'Verbose',false, ...
    'Plots','training-progress');
layers(1,1).Name = 'L1';
layers(2,1).Name = 'L2';
layers(3,1).Name = 'L3';
layers(4,1).Name = 'L4';
layers(5,1).Name = 'L5';
layers(6,1).Name = 'L6';
layers(7,1).Name = 'L7';
layers(8,1).Name = 'L8';
layers(9,1).Name = 'L9';
layers(10,1).Name = 'L10';
layers(11,1).Name = 'L11';
layers(12,1).Name = 'L12';
layers(13,1).Name = 'L13';
layers(14,1).Name = 'L14';
lgraph = layerGraph(layers);
net = trainNetwork(Inp_10,Tar_10',lgraph,options);
out = predict(net,Day9_10)