% Directorio que contiene las imágenes de los pies
directorio = 'C:\Users\Kike\Desktop\upchiapas\8vo\PROYECTO\voltear';

% Directorio para guardar las imágenes volteadas
directorioVolteado = 'C:\Users\Kike\Desktop\upchiapas\8vo\PROYECTO';

% Obtener la lista de archivos en el directorio
archivos = dir(fullfile(directorio, '*.png')); % Cambia la extensión según tus imágenes

% Iterar sobre cada archivo de imagen
for i = 1:length(archivos)
    % Leer la imagen
    nombreArchivo = archivos(i).name;
    rutaCompleta = fullfile(directorio, nombreArchivo);
    imagen = imread(rutaCompleta);

    % Voltear la imagen horizontalmente (espejo)
    imagenVolteada = fliplr(imagen);

    % Guardar la imagen volteada en el directorio de salida
    nombreArchivoVolteado = nombreArchivo;
    rutaCompletaVolteado = fullfile(directorioVolteado, nombreArchivoVolteado);
    imwrite(imagenVolteada, rutaCompletaVolteado);
end
