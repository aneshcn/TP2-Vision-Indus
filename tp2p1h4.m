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

% Filtre Sobel h4
h4 = [2  1  0;
      1  0 -1;
      0 -1 -2];

% Application du filtre h4 sur X
Inspection4 = conv2(IM,h4);


figure;

subplot(3,1,1);
imshow(X);
title('Image en niveaux de gris');

subplot(3,1,2);
imshow(mat2gray(Inspection4));
title('Resultat du filtre h4');

subplot(3,1,3);
imshow(mat2gray(abs(Inspection4)));
title('Valeur absolue du filtre h4');


Gy = h4';

Insp1 = filter2(h4,IM);
Insp2 = filter2(Gy,IM);


G = sqrt(Insp1.^2 + Insp2.^2);


Gmax = max(G(:));
Gmin = min(G(:));
dx = Gmax-Gmin;

if dx ~= 0
    Gn = 255*((G-Gmin)/dx);
else
    Gn = zeros(size(G));
end

figure;
imshow(Gn);
title('Gradient normalise Gn');
