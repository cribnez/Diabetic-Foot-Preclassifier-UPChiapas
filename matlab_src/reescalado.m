I = imread('C:\Users\jimen\OneDrive\Escritorio\PROYECTO\PIE SANO\PLANTA\IMG_0218.bmp');

J = imadjust(I,[0 1],[66/255    185/255]);

figure;
imshow(I)
title('original')
figure;
imshow(J)
title('mapeado')