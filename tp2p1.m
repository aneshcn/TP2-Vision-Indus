
clc;
clear all;
close all;

Im_Industrial = imread("C:\Users\anesn\Desktop\AII 2ème Année\VI\TP\tp2\Inspection.jpg");
whos Im_Industrial;

X = rgb2gray(Im_Industrial);
IM = double(X);

figure;
subplot(1,2,1);
imshow(Im_Industrial);
title('Image originale');

subplot(1,2,2);
imshow(X);
title('Image en niveaux de gris');

h3 = [1 0 -1;
      2 0 -2;
      1 0 -1];

Inspection3 = conv2(X,h3);

figure;

subplot(3,1,1);
imshow(X);
title('Image en niveaux de gris');

subplot(3,1,2);
imshow(mat2gray(Inspection3));
title('Resultat du filtre h3');

subplot(3,1,3);
imshow(mat2gray(abs(Inspection3)));
title('Valeur absolue de h3');

Gy = h3';

Insp1 = filter2(h3,IM);
Insp2 = filter2(Gy,IM);

G = sqrt(Insp1.^2 + Insp2.^2);

Gmax = max(G(:));
Gmin = min(G(:));
dx = Gmax-Gmin;

Gn = 255*(G-Gmin)/dx;

figure;
imshow(Gn);
title('Gradient normalise Gn');
