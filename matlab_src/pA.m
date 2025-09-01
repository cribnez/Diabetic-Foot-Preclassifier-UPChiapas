% Cargar las imágenes de prueba desde la carpeta
testImageDir = 'C:\Users\ENRIQ\OneDrive\Escritorio\extrasproyec\validacion';
testImages = imageDatastore(testImageDir, 'IncludeSubfolders', true, 'LabelSource', 'foldernames');

% Redimensionar las imágenes a [224 224 3]
inputSize = [224 224 3];
testImages.ReadFcn = @(filename) imresize(imread(filename), inputSize(1:2));

% Realizar predicciones en las imágenes de prueba
predictions = classify(netfot, testImages);
% Obtener las etiquetas reales
testLabels = testImages.Labels;

% Calcular la precisión
accuracy = sum(predictions == testLabels) / numel(testLabels);

fprintf('Accuracy: %.2f%%\n', accuracy * 100);

% Obtener las clases
class_names = categories(predictions);

% Crear una matriz de confusión
C = confusionmat(testLabels, predictions, 'Order', class_names);

% Crear un gráfico de matriz de confusión
confusionchart(C, class_names);



