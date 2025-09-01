pathToImages = 'C:\Users\Kike\Desktop\upchiapas\8vo\PROYECTO';

% Obtener la lista de subcarpetas dentro de la carpeta "PROYECTO"
subfolders = dir(fullfile(pathToImages, '*'));
subfolders = subfolders([subfolders.isdir]); % Filtrar solo las carpetas
subfolders = subfolders(3:end); % Excluir las carpetas '.' y '..'

% Crear los imageDatastore para cada clase
imageDatastores = cell(1, numel(subfolders));
for i = 1:numel(subfolders)
    folderPath = fullfile(subfolders(i).folder, subfolders(i).name);
    imageDatastores{i} = imageDatastore(folderPath, "IncludeSubfolders", true, "LabelSource", "foldernames");
end

% Dividir los imageDatastore en conjuntos de entrenamiento y prueba
trainImgs = cell(1, numel(subfolders));
testImgs = cell(1, numel(subfolders));
for i = 1:numel(subfolders)
    [trainImgs{i}, testImgs{i}] = splitEachLabel(imageDatastores{i}, 0.8,"randomized");
end

% Redimensionar las imágenes de entrenamiento y prueba
resizeTrainImgs = cell(1, numel(subfolders));
resizeTestImgs = cell(1, numel(subfolders));
for i = 1:numel(subfolders)
    resizeTrainImgs{i} = augmentedImageDatastore([224 224], trainImgs{i});
    resizeTestImgs{i} = augmentedImageDatastore([224 224], testImgs{i});
end

% Obtener el número de clases
numClasses = numel(subfolders);

% Mostrar los nombres de cada clase
classNames = cell(1, numClasses);
for i = 1:numClasses
    classNames{i} = subfolders(i).name;
end
disp(classNames);
opts = trainingOptions("sgdm","InitialLearnRate",0.001,"MaxEpochs",1,"VerboseFrequency",2);

