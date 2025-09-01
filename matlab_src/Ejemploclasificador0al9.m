% Load image data
digitDatasetPath = fullfile(matlabroot,'toolbox','nnet','nndemos','nndatasets','DigitDataset');
imds = imageDatastore(digitDatasetPath, 'IncludeSubfolders', true, 'LabelSource', 'foldernames');

% Split data into training and validation sets
numTrainFiles = 750;
[imdsTrain, imdsValidation] = splitEachLabel(imds, numTrainFiles, 'randomized');

% Define CNN architecture
layers = [
    imageInputLayer([28 28 1])
    convolution2dLayer(5, 20)
    batchNormalizationLayer
    reluLayer
    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];

% Specify training options
options = trainingOptions('sgdm', 'MaxEpochs', 20, 'InitialLearnRate', 0.001);

% Train network
net = trainNetwork(imdsTrain, layers, options);

% Test network
im = imread('test_image.jpg');
im = imresize(im, [28 28]);
label = classify(net, im);
disp(label);