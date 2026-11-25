
clc; clear all; close all;

Im_Industrial = imread("C:\Users\anesn\Desktop\AII 2ème Année\VI\TP\tp2\Inspection.jpg");

X = rgb2gray(Im_Industrial);
IM = double(X);

figure;
subplot(1,2,1);
imshow(Im_Industrial);
title('Image originale');

subplot(1,2,2);
imshow(X);
title('Image en niveaux de gris');


hx = [1 0 -1];

Inspection3 = filter2(hx, IM);

figure;

subplot(3,1,1);
imshow(X);
title('Image en niveaux de gris');

subplot(3,1,2);
imshow(mat2gray(Inspection3));
title('Résultat du filtre hx');

subplot(3,1,3);
imshow(mat2gray(abs(Inspection3)));
title('Valeur absolue du filtre hx');



Gx = filter2(hx, IM);

hy = hx';

Gy = filter2(hy, IM);


G = sqrt(Gx.^2 + Gy.^2);

Gmax = max(G(:));
Gmin = min(G(:));


if Gmax ~= Gmin
    Gn = 255 * (G - Gmin) / (Gmax - Gmin);
else
    Gn = zeros(size(G));
end

figure;
imshow(Gn);
title('Gradient normalisé Gn');
