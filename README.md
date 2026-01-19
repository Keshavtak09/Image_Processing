# Digital Image Processing

## Overview
This repository contains basic Digital Image Processing (DIP) lab programs implemented using MATLAB.  
The tasks focus on understanding fundamental image operations and histogram equalization techniques.

---

## 1. Basic Image Processing Commands
This program demonstrates basic MATLAB and image processing operations.

### Tasks Covered
- Creation of an 8×8 matrix with random values (0–255)
- Reading and displaying an RGB image
- Conversion of RGB image to grayscale
- Extraction of red color channel
- Conversion of grayscale image to binary using thresholding
- Histogram equalization using MATLAB built-in function

### Concepts Used
- Matrix operations
- Color to grayscale conversion
- Image thresholding
- Basic contrast enhancement

---

## 2. Histogram Equalization
This program demonstrates histogram equalization using:
- MATLAB built-in function
- Manual implementation step by step

### Tasks Covered
- Reading grayscale image
- Histogram equalization using `histeq`
- Manual calculation of:
  - Unique intensity values
  - Frequency distribution
  - Cumulative Distribution Function (CDF)
  - New intensity mapping
- Generation of equalized image

### Purpose
To understand how histogram equalization works internally and how contrast enhancement is achieved.

---

## Requirements
- MATLAB
- Image Processing Toolbox

## How to Run
1. Place the required image files (`car.png`, `input.jpg`) in the same folder as the MATLAB scripts.
2. Open the scripts in MATLAB.
3. Run the files to view outputs.

## Output
The programs display original and processed images for visual comparison.

