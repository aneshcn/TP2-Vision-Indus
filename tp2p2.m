clc; clear all; close all;


Img = imread("C:\Users\anesn\Desktop\AII 2ème Année\VI\TP\tp2\Inspection.jpg");


I = rgb2gray(Img);


figure;
imshow(I);
title('Image en niveaux de gris');


[M,N] = size(I);



X = imhist(I);

Xc = cumsum(X);

seuil = 0.01*M*N;

a = find(Xc >= seuil, 1, 'first') - 1;

b = find(Xc >= (M*N-seuil), 1, 'first') - 1;

fprintf('Seuil a = %d\n', a);
fprintf('Seuil b = %d\n', b);


matrice1 = zeros(M,N);

for i = 1:M
    for j = 1:N


        f = double(I(i,j));


        if f < a
            matrice1(i,j) = 0;

        elseif f > b
            matrice1(i,j) = 255;

        else
            matrice1(i,j) = round( ...
                255*(f-a)/(b-a));
        end

    end
end


figure;

subplot(2,2,1);
imshow(I);
title('Image originale');

subplot(2,2,2);
imhist(I);
title('Histogramme original');

subplot(2,2,3);
imshow(uint8(matrice1));
title('Image apres cropping');

subplot(2,2,4);
imhist(uint8(matrice1));
title('Nouvel histogramme');




matrice = zeros(M,N);

for i = 1:M
    for j = 1:N


        f = double(I(i,j));


        if f <= a
            matrice(i,j) = round((b/a)*f);


        else
            matrice(i,j) = round( ...
                ((255-b)*f + 255*(b-a))/(255-a));
        end

    end
end



figure;

subplot(2,2,1);
imshow(I);
title('Image originale');

subplot(2,2,2);
imshow(uint8(matrice1));
title('Dynamic Range Cropping');

subplot(2,2,3);
imshow(uint8(matrice));
title('Contrast Enhancement');

subplot(2,2,4);
imhist(uint8(matrice));
title('Histogramme apres enhancement');
