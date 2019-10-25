% Cubic Regression
% Hourly Data of GHIrsi (W/m²) average
clc, clear
inputfilename = 'kskmeteo.xlsx';
outputfilename = 'Forecast.xlsx';
Data = xlsread(inputfilename,3,'D72:O132696');

for i=1:921
    x(:,:,i)=Data(1+(i-1)*144:(i-1)*144+144,:);
end

layers = [
    imageInputLayer([144 12 1])
    convolution2dLayer(3,8,'Padding','same')
    
    reluLayer
     maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(3,16,'Padding','same')
    
    reluLayer
     maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(3,32,'Padding','same')
    
    reluLayer
    fullyConnectedLayer(144)
    regressionLayer];
options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',10, ...
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
% layers(12,1).Name = 'L12';
% layers(13,1).Name = 'L13';
% layers(14,1).Name = 'L14';
lgraph = layerGraph(layers);
Train_Data = reshape(x(:,:,1:920),[144 12 1 920]);
Target_Data = reshape(x(:,1,2:921),[144 920])';
net = trainNetwork(Train_Data,Target_Data,lgraph,options);
out = predict(net,reshape(x(:,:,233),144,12,1));
out2 = predict(net,reshape(x(:,:,435),144,12,1));
plot(out),hold,plot(out2)


save net
load net
out = predict(net1,reshape(x(:,:,921),144,12,1))

