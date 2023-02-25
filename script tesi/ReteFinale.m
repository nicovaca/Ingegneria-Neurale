clc
clear all
close all

%% DATABASE
digitDatasetPath = fullfile('/home/vacalebre2022/Desktop/Dataset/S1_mappeTF_3D/');
imds = imageDatastore(digitDatasetPath, 'IncludeSubfolders',true,'ReadFcn', @readFcn_N, 'LabelSource','foldernames',"FileExtensions",".mat");

%% CONTA NUMERO di elementi per ogni classe

% (v. variabile imds.Labels)

labelCount = countEachLabel(imds);

%% DIVIDI IN TRAIN AND TEST
numTrainFiles = round(.3*min(labelCount.Count));% 70% per il training set

% creo in modo casuale il dataset di train e quello di test:
[imdsTest,imdsTrain] = splitEachLabel(imds,numTrainFiles,'randomize');

%% ESEMPI DI dati DEL DB

%%Read the first data
a=0;
if a==1
    idx=1;
    filename =imds.Files(idx);
    file = readFcn_N2(filename{1,1});
    size(file)
    vw = readVideo(file);
    %%View the corrispondent label
    imds.Labels(idx)
    %Plot a single frame
%     imagesc(1,fxx,file(:,:,1));% crea immagine di CWT^2
%     xlabel('Channel');
%     ylabel('Frequency');
%     set(gca,'Fontsize',8);
end


%% Convert Frames to Feature Vectors

%%Creazione CNN
%%Number of layers: 94
%%Number of connections: 101
lgraph = layerGraph();

%Add the Layer Branches
tempLayers = [
    imageInputLayer([68 62],"Name","imageinput")
    convolution2dLayer([3 3],64,"Name","conv_1","Padding","same","Stride",[2 2])
    batchNormalizationLayer
    reluLayer("Name","relu")
    maxPooling2dLayer([3 3],"Name","maxpool_1","Padding","same","Stride",[2 2])
    convolution2dLayer([3 3],32,"Name","conv_2","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire2-relu_squeeze1x1")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    convolution2dLayer([3 3],64,"Name","conv_3","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire2-relu_expand1x1")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    convolution2dLayer([3 3],64,"Name","conv_4","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire2-relu_expand3x3")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    depthConcatenationLayer(2,"Name","fire2-concat")
    convolution2dLayer([3 3],16,"Name","conv_5","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire3-relu_squeeze1x1")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    convolution2dLayer([3 3],64,"Name","conv_6","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire3-relu_expand1x1")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    convolution2dLayer([3 3],64,"Name","conv_7","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire3-relu_expand3x3")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    depthConcatenationLayer(2,"Name","fire3-concat")
    maxPooling2dLayer([3 3],"Name","maxpool_2","Padding","same","Stride",[2 2])
    convolution2dLayer([3 3],32,"Name","conv_8","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire4-relu_squeeze1x1")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    convolution2dLayer([1 1],128,"Name","conv_10","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire4-relu_expand3x3")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    convolution2dLayer([1 1],128,"Name","conv_9","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire4-relu_expand1x1")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    depthConcatenationLayer(2,"Name","fire4-concat")
    convolution2dLayer([1 1],32,"Name","conv_11","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire5-relu_squeeze1x1")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    convolution2dLayer([1 1],128,"Name","conv_12","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire5-relu_expand1x1")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    convolution2dLayer([3 3],128,"Name","conv_13","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire5-relu_expand3x3")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    depthConcatenationLayer(2,"Name","fire5-concat")
    maxPooling2dLayer([3 3],"Name","maxpool_3","Padding","same","Stride",[2 2])
    convolution2dLayer([1 1],48,"Name","conv_14","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire6-relu_squeeze1x1")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    convolution2dLayer([1 1],192,"Name","conv_15","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire6-relu_expand1x1")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    convolution2dLayer([3 3],192,"Name","conv_16","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire6-relu_expand3x3")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    depthConcatenationLayer(2,"Name","fire6-concat")
    convolution2dLayer([1 1],48,"Name","conv_17","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire7-relu_squeeze1x1")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    convolution2dLayer([3 3],192,"Name","conv_19","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire7-relu_expand3x3")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    convolution2dLayer([1 1],192,"Name","conv_18","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire7-relu_expand1x1")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    depthConcatenationLayer(2,"Name","fire7-concat")
    convolution2dLayer([1 1],64,"Name","conv_20","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire8-relu_squeeze1x1")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    convolution2dLayer([1 1],256,"Name","conv_21","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire8-relu_expand1x1")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    convolution2dLayer([3 3],256,"Name","conv_22","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire8-relu_expand3x3")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    depthConcatenationLayer(2,"Name","fire8-concat")
    convolution2dLayer([1 1],64,"Name","conv_23","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire9-relu_squeeze1x1")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    convolution2dLayer([3 3],256,"Name","conv_25","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire9-relu_expand3x3")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    convolution2dLayer([1 1],256,"Name","conv_24","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","fire9-relu_expand1x1")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    depthConcatenationLayer(2,"Name","fire9-concat")
    dropoutLayer(0.5,"Name","drop9")
    convolution2dLayer([1 1],4,"Name","conv_26","Padding","same")
    batchNormalizationLayer
    reluLayer("Name","relu_conv10")
    globalAveragePooling2dLayer("Name","pool10")
    softmaxLayer("Name","prob")
    classificationLayer("Name","classoutput")];
lgraph = addLayers(lgraph,tempLayers);

%Connect the Layer Branches
lgraph = connectLayers(lgraph,"fire2-relu_squeeze1x1","conv_3");
lgraph = connectLayers(lgraph,"fire2-relu_squeeze1x1","conv_4");
lgraph = connectLayers(lgraph,"fire2-relu_expand1x1","fire2-concat/in1");
lgraph = connectLayers(lgraph,"fire2-relu_expand3x3","fire2-concat/in2");
lgraph = connectLayers(lgraph,"fire3-relu_squeeze1x1","conv_6");
lgraph = connectLayers(lgraph,"fire3-relu_squeeze1x1","conv_7");
lgraph = connectLayers(lgraph,"fire3-relu_expand1x1","fire3-concat/in1");
lgraph = connectLayers(lgraph,"fire3-relu_expand3x3","fire3-concat/in2");
lgraph = connectLayers(lgraph,"fire4-relu_squeeze1x1","conv_10");
lgraph = connectLayers(lgraph,"fire4-relu_squeeze1x1","conv_9");
lgraph = connectLayers(lgraph,"fire4-relu_expand3x3","fire4-concat/in2");
lgraph = connectLayers(lgraph,"fire4-relu_expand1x1","fire4-concat/in1");
lgraph = connectLayers(lgraph,"fire5-relu_squeeze1x1","conv_12");
lgraph = connectLayers(lgraph,"fire5-relu_squeeze1x1","conv_13");
lgraph = connectLayers(lgraph,"fire5-relu_expand1x1","fire5-concat/in1");
lgraph = connectLayers(lgraph,"fire5-relu_expand3x3","fire5-concat/in2");
lgraph = connectLayers(lgraph,"fire6-relu_squeeze1x1","conv_15");
lgraph = connectLayers(lgraph,"fire6-relu_squeeze1x1","conv_16");
lgraph = connectLayers(lgraph,"fire6-relu_expand1x1","fire6-concat/in1");
lgraph = connectLayers(lgraph,"fire6-relu_expand3x3","fire6-concat/in2");
lgraph = connectLayers(lgraph,"fire7-relu_squeeze1x1","conv_19");
lgraph = connectLayers(lgraph,"fire7-relu_squeeze1x1","conv_18");
lgraph = connectLayers(lgraph,"fire7-relu_expand3x3","fire7-concat/in2");
lgraph = connectLayers(lgraph,"fire7-relu_expand1x1","fire7-concat/in1");
lgraph = connectLayers(lgraph,"fire8-relu_squeeze1x1","conv_21");
lgraph = connectLayers(lgraph,"fire8-relu_squeeze1x1","conv_22");
lgraph = connectLayers(lgraph,"fire8-relu_expand1x1","fire8-concat/in1");
lgraph = connectLayers(lgraph,"fire8-relu_expand3x3","fire8-concat/in2");
lgraph = connectLayers(lgraph,"fire9-relu_squeeze1x1","conv_25");
lgraph = connectLayers(lgraph,"fire9-relu_squeeze1x1","conv_24");
lgraph = connectLayers(lgraph,"fire9-relu_expand3x3","fire9-concat/in2");
lgraph = connectLayers(lgraph,"fire9-relu_expand1x1","fire9-concat/in1");

%Clean Up Helper Variable
clear tempLayers;


%Plot the graph
a=0;
if a==1
    plot(lgraph);
end

%% TRAINING SET-UP
%Create new DB for training CNN:
dirnameTrain='/home/vacalebre2022/Desktop/Dataset/Mappe_2DTrain/';
dirnameTest='/home/vacalebre2022/Desktop/Dataset/Mappe_2DTest/';
imdsTrain_mappe = transformImdsTrain(imdsTrain,dirnameTrain);
imdsTest_mappe = transformImdsTest(imdsTest,dirnameTest);

% vedi:
% 'MiniBatchSize'
% numinput/minibatch deve essere un numero intero

options = trainingOptions('adam', ...
    'ExecutionEnvironment','gpu', ... % oppure 'cpu'
    'LearnRateSchedule','none',...%The learning rate remains constant throughout training
    'MaxEpochs',4,...
    'MiniBatchSize',25,...% default 128
    'Plots','training-progress');


%%
%% %% TRAIN CNN per impostare pesi e bias.

tic
netCNN = trainNetwork(imdsTrain_mappe,lgraph,options);
toc

%% PERFORMANCE (dataset TEST)

Ytest = classify(netCNN,imdsTest_mappe); % predicted, estimated output
Dtest = imdsTest_mappe.Labels;        % target, desired response

% accuracy (test set)
accuracy_testCNN = sum(Ytest == Dtest)/numel(Dtest)*100


%% PERFORMANCE (dataset TRAIN)

Ytrain = classify(netCNN,imdsTrain_mappe);   %predicted
Dtrain = imdsTrain_mappe.Labels;          %target

accuracy_TrainCNN = sum(Ytrain == Dtrain)/numel(Dtrain)*100

%% Creazione video da dare in pasto alla rete
%Create new DB for training LSTM:
dirnameTrain='/home/vacalebre2022/Desktop/Dataset/Mappe_4DTrain/';
dirnameTest='/home/vacalebre2022/Desktop/Dataset/Mappe_4DTest/';
imdsTrain4 = mappe4DTrain(imdsTrain,dirnameTrain);
imdsTest4 = mappe4DTest(imdsTest,dirnameTest);

%% %Creazione delle sequenze
%inputSize = lgraph.Layers(1).InputSize(1:2);
layerName = "pool10";
numFiles=size(imdsTrain.Files,1);
sequences = cell(numFiles,1);

%Creazione delle sequenze
 for i = 1:numFiles
    
    files=imdsTrain.Files(i,1);
    
    sequence = b(files{1,1});
    
    
    sequences{i,1} = activations(netCNN,sequence,layerName,'OutputAs','columns');
    
 end

%Creazione labels
for i = 1:numFiles
    
    
    labels{i,1}=imdsTrain.Labels(i);
   
    
end

%Holdout Validation
numObservations = numel(sequences);
idx = randperm(numObservations);
N = floor(0.9 * numObservations);

idxTrain = idx(1:N);
sequencesTrain = sequences(idxTrain);
labelsTrain = labels(idxTrain);

idxValidation = idx(N+1:end);
sequencesValidation = sequences(idxValidation);
labelsValidation = labels(idxValidation);

S1 = string(labelsTrain);
labelsTrain = categorical(S1);
S3 = string(labelsValidation);
labelsValidation = categorical(S3);
%% Create LSTM Network

numFeatures = size(sequencesTrain{1},1);
%numClasses = 5;
numClasses = numel(categories(labelsTrain));


layers = [
    sequenceInputLayer(numFeatures,'Name','sequence')
    bilstmLayer(2000,'OutputMode','last','Name','bilstm')
    dropoutLayer(0.5,'Name','drop')
    fullyConnectedLayer(numClasses,'Name','fc')
    softmaxLayer('Name','softmax')
    classificationLayer('Name','classification')];

miniBatchSize = 16;
numObservations = numel(sequencesTrain);
numIterationsPerEpoch = floor(numObservations / miniBatchSize);

options = trainingOptions('adam', ...
    'MiniBatchSize',miniBatchSize, ...
    'InitialLearnRate',1e-4, ...
    'GradientThreshold',2, ...
    'Shuffle','every-epoch', ...
    'ValidationData',{sequencesValidation,labelsValidation}, ...
    'ValidationFrequency',numIterationsPerEpoch, ...
    'Plots','training-progress', ...
    'Verbose',false);

%Train LSTM Network
[netLSTM,info] = trainNetwork(sequencesTrain,labelsTrain,layers,options);

%%Calcolo Accuracy:
YPred = classify(netLSTM,sequencesValidation,'MiniBatchSize',miniBatchSize);
YValidation = labelsValidation;
accuracyLSTM = mean(YPred == YValidation)*100

% %Oppure
% %% PERFORMANCE (dataset TEST)
% 
% Ytest = classify(netLSTM,sequencesValidation); % predicted, estimated output
% Dtest = labelsValidation;% target, desired response
% 
% % accuracy (test set)
% accuracy_test = sum(Ytest == Dtest')/numel(Dtest)

%% Assemble Video Classification Network
cnnLayers = layerGraph(netCNN);

%Remove the input layer ("data") and the layers after the pooling layer used for the activations
layerNames = ["imageinput" "prob" "classoutput"];
cnnLayers = removeLayers(cnnLayers,layerNames);

%Add Sequence Input Layer
inputSize = netCNN.Layers(1).InputSize(1:2);
averageImage = netCNN.Layers(1).Mean;

inputLayer = sequenceInputLayer([inputSize 1], ...
    'Normalization','zerocenter', ...
    'Mean',averageImage, ...
    'Name','input');

layers = [
    inputLayer
    sequenceFoldingLayer('Name','fold')];

lgraph = addLayers(cnnLayers,layers);
lgraph = connectLayers(lgraph,"fold/out","conv_1");

%Add LSTM Layers
lstmLayers = netLSTM.Layers;
lstmLayers(1) = [];

layers = [
    sequenceUnfoldingLayer('Name','unfold')
    flattenLayer('Name','flatten')
    lstmLayers];

lgraph = addLayers(lgraph,layers);
lgraph = connectLayers(lgraph,"pool10","unfold/in");

lgraph = connectLayers(lgraph,"fold/miniBatchSize","unfold/miniBatchSize");

%Assemble Network
analyzeNetwork(lgraph)
net = assembleNetwork(lgraph);

%% Classify Using New Data
%filename = "/home/vacalebre2022/Desktop/DB/RH/S1_Session1_EEG6.mat";
filename=imdsTest.Files{21,1};
video = b(filename);
YPred = classify(net,{video})



%% PERFORMANCE (dataset TEST)

%Ytest = classify(net,imdsTest); % predicted, estimated output
Dtest = imdsTest.Labels;        % target, desired response

numFiles=size(imdsTest.Files,1);
for i = 1:numFiles
    filename=imdsTest.Files{i,1};
    video = b(filename);
    YPred = classify(net,{video});
    Ypred2{i,1}=YPred;
end
S3 = string(Ypred2);
Ytest = categorical(S3);

accuracy_test = sum(Ytest == Dtest)/numel(Dtest)*100
plotconfusion(Dtest,Ytest)

% extract the confusion matrix
confMat_Test=confusionmat(Dtest,Ytest);
confMat_Test=confMat_Test'; 
%Calcolo metriche
[Result_special,ReferenceResult] = multiclass_metrics_special(confMat_Test)

