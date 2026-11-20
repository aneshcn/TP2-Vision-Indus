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
