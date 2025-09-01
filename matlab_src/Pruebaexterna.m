% Ruta de la imagen a probar
imagePath = 'C:\Users\Kike\Desktop\upchiapas\8vo\Ejemplos\SP\IMG_0499.png';

% Cargar la imagen
im = imread(imagePath);

% Redimensionar la imagen al tamaño de entrada de la red
inputSize = [224, 224, 3]; % Tamaño de entrada de la red
im = imresize(im, inputSize(1:2));

% Realizar la predicción utilizando la red neuronal entrenada
prediction = classify(netfot, im);

% Mostrar la imagen y la predicción
imshow(im);
title(['Predicción: ' char(prediction)]);

