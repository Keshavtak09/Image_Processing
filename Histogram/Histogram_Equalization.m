
% Description : Histogram Equalization using MATLAB inbuilt function
%               and manual implementation

clc;
clear;
close all;

%% Read and display original image
img = imread('input.jpeg');

figure;
imshow(img);
title('Grayscale Image');

%% Histogram equalization using MATLAB built-in function
figure;
img_eq_builtin = histeq(img);
imshow(img_eq_builtin);
title('Histogram Equalized Image (MATLAB)');

%% Manual Histogram Equalization

% Get image size
[rows, cols] = size(img);

% Step 1: Find unique intensity values
unique_vals = [];

for r = 1:rows
    for c = 1:cols
        pixel = img(r,c);
        isPresent = false;

        for k = 1:length(unique_vals)
            if unique_vals(k) == pixel
                isPresent = true;
                break;
            end
        end

        if ~isPresent
            unique_vals(end+1,1) = pixel;
        end
    end
end

% Step 2: Sort intensity values
unique_vals = sort(unique_vals);

% Step 3: Count frequency of each intensity
freq_table = zeros(length(unique_vals),2);
freq_table(:,1) = unique_vals;

for k = 1:length(unique_vals)
    intensity = unique_vals(k);
    count = 0;

    for r = 1:rows
        for c = 1:cols
            if img(r,c) == intensity
                count = count + 1;
            end
        end
    end

    freq_table(k,2) = count;
end

% Step 4: Compute CDF
cdf_values = zeros(length(unique_vals),1);
cdf_sum = 0;

for k = 1:length(unique_vals)
    cdf_sum = cdf_sum + freq_table(k,2);
    cdf_values(k) = cdf_sum;
end

% Step 5: Compute new intensity values
cdf_min = min(cdf_values);
total_pixels = rows * cols;
new_intensity = zeros(length(unique_vals),1);

for k = 1:length(unique_vals)
    new_intensity(k) = round(((cdf_values(k) - cdf_min) / ...
        (total_pixels - cdf_min)) * 255);
end

% Step 6: Generate equalized image
img_eq_manual = zeros(rows, cols);

for r = 1:rows
    for c = 1:cols
        old_pixel = img(r,c);

        for k = 1:length(unique_vals)
            if old_pixel == freq_table(k,1)
                img_eq_manual(r,c) = new_intensity(k);
                break;
            end
        end
    end
end

% Convert to uint8 and display
img_eq_manual = uint8(img_eq_manual);

figure;
imshow(img_eq_manual);
title('Histogram Equalized Image');
