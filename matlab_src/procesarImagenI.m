function salida = procesarImagenI(inputFilePath)
    % Carga la imagen
    I = imread(inputFilePath);

    % Obtiene la capa azul de la imagen YCbCr
    blue_layer = I(:,:,3);
    Red_layer = I(:,:,1);
    Green_layer = I(:,:,2);
    % Aplica el umbral a la capa azul
    threshold = 110;
    binaryimg = imbinarize(blue_layer, threshold/255);

    % Muestra la imagen binaria resultante
    binarycom = imcomplement(binaryimg);
    %imshow(binarycom);
    Ifill = imfill(binarycom,'holes');

    % Asigna un valor de 0 a las filas del 0 al 50
    Ifill(1:30,:) = 0;
    Ifill(:,1:30) = 0;
    Ifill(:,200:end)= 0;
    %figure;
    %imshow(Ifill);
    salida = uint8(Ifill).*uint8(I);

    % Reajusta la imagen final a un tamaño de 224x224x3
    salida = imresize(salida, [224, 224]);

    % Voltear la imagen horizontalmente (espejo)
    iflip = fliplr(salida);

    % Construye la ruta completa del archivo de salida en formato .png
    [outputPath, outputName, ~] = fileparts(inputFilePath);
    outputFileName = [outputName, '.png'];
    outputFilePath = fullfile(outputPath, outputFileName);

    % Guarda la imagen procesada en formato .png
    imwrite(iflip, outputFilePath);
end
