clc;
clear all;
close all;

I=imread('sid.jpeg');

figure;
subplot(2,3,1);
imshow(I);
title('OriginalImage');

Ig=rgb2gray(I);
subplot(2,3,2);
imshow(Ig);
title('GrayscaleImage');

[Ia,Iv,Ih,Id]=dwt2(Ig,'haar');

subplot(2,3,4);
imshow(Ia,[]);
title('Approximation');

subplot(2,3,5);
imshow(Ih,[]);
title('Horizontal');

subplot(2,3,6);
imshow(Iv,[]);
title('Vertical');

subplot(2,3,3);
imshow(Id,[]);
title('Diagonal');

figure;
Irec=idwt2(Ia,Iv,Ih,Id,'haar');
imshow(uint8(Irec));
title('ReconstructedImage');