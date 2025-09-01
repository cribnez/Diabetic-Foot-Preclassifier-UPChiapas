% Importa la imagen
image = imread('C:\Users\Kike\Desktop\upchiapas\8vo\PROYECTO\DiabeticoPlanta\IMG_0190.png');

% Muestra la imagen
imshow(image);

% Selecciona la región de interés
mask = roipoly();

% Binariza la región de interés
binary_image = uint8(mask) .* image;

% Muestra la imagen binarizada
imshow(binary_image);

Blue_layer = binary_image(:,:,3);
Red_layer = binary_image(:,:,1);
Green_layer = binary_image(:,:,2);
imwrite(binary_image, 'C:\Users\Kike\Desktop\upchiapas\8vo\PROYECTO\PIE SANO\PLANTAMOD\IMG_0254.bmp');