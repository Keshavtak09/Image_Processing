clc;
close all;
clear all;

A = zeros(8,8);     

for ii = 1:8
    for jj = 1:8
        A(ii,jj) = randi([0,255]);                  
    end
end
I = imread("car.png");
figure
imshow(I);
Ig = rgb2gray(I);
figure
imshow(Ig);

Ired = I;
Ired(:,:,2) = 0;
Ired(:,:,3) = 0;
figure
imshow(Ired);

Ibw = Ig>120;
figure
imshow(Ibw);

Ieq = histeq(Ig);
figure
imshow(Ieq);