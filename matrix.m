clc;            % Clears the command window
close all;      % Closes all open figure windows
clear all;      % Clears all variables from workspace

%% Creation of an 8x8 Random Matrix
% Initialize an 8x8 matrix with zeros
A = zeros(8,8);     

% Fill the matrix with random integer values between 0 and 255
% (similar to grayscale pixel intensity range)
for ii = 1:8
    for jj = 1:8
        A(ii,jj) = randi([0,255]);                  
    end
end

%% Image Reading and Display
% Read the input image
I = imread("car.png");

% Display the original RGB image
figure
imshow(I);
title('Original RGB Image');

%% Conversion to Grayscale
% Convert RGB image to grayscale
Ig = rgb2gray(I);

% Display grayscale image
figure
imshow(Ig);
title('Grayscale Image');

%% Extraction of Red Channel
% Copy original image
Ired = I;

% Remove green and blue channels
Ired(:,:,2) = 0;
Ired(:,:,3) = 0;

% Display red channel image
figure
imshow(Ired);
title('Red Channel Image');

%% Binary Image Conversion
% Convert grayscale image to binary using threshold value
Ibw = Ig > 120;

% Display binary image
figure
imshow(Ibw);
title('Binary Image');

%% Histogram Equalization
% Improve contrast using histogram equalization
Ieq = histeq(Ig);

% Display histogram-equalized image
figure
imshow(Ieq);
title('Histogram Equalized Image');
