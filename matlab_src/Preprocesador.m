% Rutas de las carpetas de entrada y salida

I = imread('C:\Users\Kike\Desktop\upchiapas\8vo\PROYECTO\Ediabitico\IMG_0406.bmp');

% Obtiene la capa azul de la imagen YCbCr
blue_layer = I(:,:,3);
Red_layer = I(:,:,1);
Green_layer = I(:,:,2);
% Aplica el umbral a la capa azul
threshold_blue = 110;
binaryimg_blue = imbinarize(blue_layer, threshold_blue/255);
threshold_Red = 80;
binaryimg_Red = imcomplement(imbinarize(Red_layer, threshold_Red/255));

% Combina los resultados de los umbrales de la capa azul y la capa verde
combined_binaryimg = binaryimg_blue & binaryimg_Red;

% Rellena los agujeros en la imagen binaria combinada
filled_img = imfill(combined_binaryimg, 'holes');

% Asigna un valor de 0 a las filas del 0 al 30 y las columnas del 0 al 30 y del 200 al final
filled_img(1:30,:) = 0;
filled_img(:,1:30) = 0;
filled_img(:,200:end) = 0;

% Visualización de la imagen binaria resultante
imshow(filled_img);

%salida = uint8(Ifill).*uint8(I);
%imshow(salida);