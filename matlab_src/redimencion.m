% Ruta de la carpeta que contiene las imágenes originales
carpeta_originales = 'C:\Users\ENRIQ\OneDrive\Escritorio\Proyecto\Accuracy\TESTIMAGE\SanoPlanta';

% Obtener la lista de archivos en la carpeta
archivos = dir(fullfile(carpeta_originales, '*.png')); % Cambia '*.jpg' según el tipo de archivo de tus imágenes

% Dimensiones deseadas para las imágenes redimensionadas
nueva_altura = 224;
nueva_ancho = 224;

% Iterar a través de los archivos en la carpeta
for i = 1:length(archivos)
    nombre_archivo = archivos(i).name;
    ruta_archivo = fullfile(carpeta_originales, nombre_archivo);
    
    % Leer la imagen original
    imagen_original = imread(ruta_archivo);
    
    % Redimensionar la imagen
    imagen_redimensionada = imresize(imagen_original, [nueva_altura, nueva_ancho]);
    
    % Construir la ruta para la imagen redimensionada en la misma carpeta
    [~, nombre_sin_extension, extension] = fileparts(nombre_archivo);
    nombre_redimensionado = [nombre_sin_extension, '_redimensionada', extension];
    ruta_redimensionada = fullfile(carpeta_originales, nombre_redimensionado);
    
    % Guardar la imagen redimensionada en la misma carpeta
    imwrite(imagen_redimensionada, ruta_redimensionada);
end

