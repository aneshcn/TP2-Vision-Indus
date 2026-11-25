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

h7 = (1/8)*[0  1  0;
            1 -4  1;
            0  1  0];

% Application du filtre h7
Inspection7 = conv2(IM,h7);

figure;

subplot(3,1,1);
imshow(X);
title('Image en niveaux de gris');

subplot(3,1,2);
imshow(mat2gray(Inspection7));
title('Resultat du filtre Laplacien h7');

subplot(3,1,3);
imshow(mat2gray(abs(Inspection7)));
title('Valeur absolue du filtre h7');

Gmax = max(Inspection7(:));
Gmin = min(Inspection7(:));
dx = Gmax-Gmin;

if dx ~= 0
    Gn = 255*((Inspection7-Gmin)/dx);
else
    Gn = zeros(size(Inspection7));
end

figure;
imshow(Gn);
title('Image normalisee Gn');
