
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




IMnoised = imnoise(X, 'salt & pepper');


medianf = medfilt2(IMnoised);


figure;

subplot(3,1,1);
imshow(X);
title('Image originale');

subplot(3,1,2);
imshow(IMnoised);
title('Image bruitée');

subplot(3,1,3);
imshow(medianf);
title('Image filtrée par médiane');
