% Rutas de las carpetas de entrada y salida
ImputPath = 'C:\Users\Kike\Desktop\upchiapas\8vo\PROYECTO\PIE SANO\EMPEINE';
OutputPath = 'C:\Users\Kike\Desktop\upchiapas\8vo\PROYECTO\PIE SANO\EMPEINEMOD';

% Lee la lista de archivos en la carpeta de entrada
fileList = dir(fullfile(ImputPath, '*.bmp')); % Cambia la extensión si tus imágenes tienen una extensión diferente

% Itera sobre cada archivo en la carpeta de entrada
for j = 1:numel(fileList)
    % Obtiene el nombre del archivo actual
    filename = fileList(j).name;
    
    % Construye las rutas completas de entrada y salida
    inputFilePath = fullfile(ImputPath, filename);
    outputFilePath = fullfile(OutputPath, filename);
    
    % Carga la imagen
    I = imread(inputFilePath);

% Obtiene la capa azul de la imagen YCbCr
blue_layer = I(:,:,3);
Red_layer = I(:,:,1);
Green_layer = I(:,:,2);
% Aplica el umbral a la capa azul
threshold = 80;
binaryimg = imbinarize(blue_layer, threshold/255);

% Muestra la imagen binaria resultante
binarycom = imcomplement(binaryimg);
%imshow(binarycom);
Ifill = imfill(binarycom,'holes');

% asigna un valor de 0 a las filas del 0 al 50
Ifill(1:30,:) = 0;
Ifill(:,1:30) = 0;
Ifill(:,200:end)= 0;
%figure;
%imshow(Ifill);
salida = uint8(Ifill).*uint8(I);
%{
figure
montage({salida,Ifill})

% Encuentra el índice de la primera fila no nula
first_row = 0;
for i = 1:size(Ifill, 1)
    if any(Ifill(i,:))
        first_row = i;
        break;
    end
end

% Encuentra el índice de la última fila no nula
last_row = 0;
for i = size(Ifill, 1):-1:1
    if any(Ifill(i,:))
        last_row = i;
        break;
    end
end

% Visualiza los vectores como líneas horizontales en la imagen salida
figure;
imshow(salida);
hold on;
line([1 size(salida,2)], [first_row first_row], 'Color', 'r', 'LineWidth', 2);
line([1 size(salida,2)], [last_row last_row], 'Color', 'r', 'LineWidth', 2);
hold off;

% Calculate the total number of rows between first_row and last_row
num_rows = last_row - first_row + 1;

% Calculate the number of rows for each region based on the provided percentages
percentages = [30, 22, 20, 28]; % Example percentages
region1_rows = round(num_rows * percentages(1) / 100);
region2_rows = round(num_rows * percentages(2) / 100);
region3_rows = round(num_rows * percentages(3) / 100);
region4_rows = num_rows - region1_rows - region2_rows - region3_rows;

% Crop each region based on the calculated number of rows
region1 = imcrop(salida, [1, first_row, size(salida, 2), region1_rows]);
region2 = imcrop(salida, [1, first_row + region1_rows, size(salida, 2), region2_rows]);
region3 = imcrop(salida, [1, first_row + region1_rows + region2_rows, size(salida, 2), region3_rows]);
region4 = imcrop(salida, [1, last_row - region4_rows + 1, size(salida, 2), region4_rows]);
%}
  % Guarda la imagen modificada en la carpeta de salida con el mismo nombre
    imwrite(salida, outputFilePath);
end