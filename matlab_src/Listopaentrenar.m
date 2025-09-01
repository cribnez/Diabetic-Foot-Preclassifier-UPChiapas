% Ruta a la carpeta que contiene las imágenes
pathToImages = 'C:\Users\Kike\Desktop\upchiapas\8vo\PROYECTO';

% Cargar datos de imágenes para una sola clase
desiredClass = 'SanoPlanta'; % Reemplaza con la clase deseada
imds = imageDatastore(pathToImages, 'IncludeSubfolders', true, 'LabelSource', 'foldernames');

% Dividir los datos en conjuntos de entrenamiento y validación
% 85% de imágenes para entrenamiento, 15% para validación
fracTrain = 0.90;
[imdsTrain, imdsValidation] = splitEachLabel(imds, fracTrain, 'randomized');

% Redimensionar las imágenes
inputSize = [224, 224, 3]; % Tamaño de entrada de la red
augmentedTrainingSet = augmentedImageDatastore(inputSize, imdsTrain);
augmentedValidationSet = augmentedImageDatastore(inputSize, imdsValidation);

% Opciones de entrenamiento
options = trainingOptions('adam', ...
    'MiniBatchSize', 20, ...
    'MaxEpochs', 40, ...
    'InitialLearnRate', 1e-3, ...
    'ValidationData', augmentedValidationSet, ...
    'ValidationFrequency', 10, ...
    'Verbose', true);

% Entrenar la red
[netfot, info] = trainNetwork(augmentedTrainingSet, lgraph_1, options);


