% Ruta al directorio de salida
outputDirectory = 'C:\Users\Kike\Desktop\upchiapas\8vo\Red';

% Nombre del archivo para guardar la estructura de capas
filename = 'lgraph_1.mat';

% Ruta completa al archivo de salida
outputPath = fullfile(outputDirectory, filename);

% Guardar la estructura de capas en el archivo en el directorio específico
save(outputPath, 'lgraph_1');


% Cargar la estructura de capas desde el archivo
%load('red_modificada.mat', 'lgraph_1');

% Entrenar con otra clase utilizando la estructura de capas cargada
%net = trainNetwork(augmentedTrainingSet, lgraph_1, options);

% Ruta al directorio de salida
%outputDirectory = 'C:\Users\K\Desktop\upchiapas\8vo\Red';

% Nombre del archivo para guardar la red entrenada
%filename = 'netfot.mat';

% Ruta completa al archivo de salida
%outputPath = fullfile(outputDirectory, filename);

% Guardar la red entrenada en el archivo en el directorio específico
%save(outputPath, 'netfot');

% Cargar la red entrenada desde el archivo
%load(outputPath, 'netfot');