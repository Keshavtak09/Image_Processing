clc;
clear all;
close all;

img=imread('cameraman.tif');
imshow(img);
title('OriginalImage');

[m,n]=size(img);%imagesize
figure;

%bitplaneslicing

%for0thbitplane
for ii=1:m
    for jj=1:n
        Bitp0(ii,jj)=bitand(img(ii,jj),1);%extractLSB
    end
end

%for1stbitplane
for ii=1:m
    for jj=1:n
        Bitp1(ii,jj)=bitand(img(ii,jj),2);
    end
end

%for2ndbitplane
for ii=1:m
    for jj=1:n
        Bitp2(ii,jj)=bitand(img(ii,jj),4);
    end
end

%for3rdbitplane
for ii=1:m
    for jj=1:n
        Bitp3(ii,jj)=bitand(img(ii,jj),8);
    end
end

%for4thbitplane
for ii=1:m
    for jj=1:n
        Bitp4(ii,jj)=bitand(img(ii,jj),16);
    end
end

%for5thbitplane
for ii=1:m
    for jj=1:n
        Bitp5(ii,jj)=bitand(img(ii,jj),32);
    end
end

%for6thbitplane
for ii=1:m
    for jj=1:n
        Bitp6(ii,jj)=bitand(img(ii,jj),64);
    end
end

%for7thbitplane
for ii=1:m
    for jj=1:n
        Bitp7(ii,jj)=bitand(img(ii,jj),128);
    end
end

imshow(Bitp0);
title('0th bit plane Image');
figure;
imshow(Bitp1);
title('1st bit plane Image');
figure;
imshow(Bitp2);
title('2nd bit plane Image');
figure;
imshow(Bitp3);
title('3rd bit plane Image');
figure;
imshow(Bitp4);
title('4th bit plane Image');
figure;
imshow(Bitp5);
title('5th bit plane Image');
figure;
imshow(Bitp6);
title('6th bit plane Image');
figure;
imshow(Bitp7);
title('7th bit plane Image');

%bitplaneremoval
%removing0th,5thand7thbitplanes
for ii=1:m
    for jj=1:n
        bitpr0(ii,jj)=bitand(img(ii,jj),(255-(2^0)));%remove0thbit
        bitpr5(ii,jj)=bitand(img(ii,jj),(255-(2^5)));%remove5thbit
        bitpr7(ii,jj)=bitand(img(ii,jj),(255-(2^7)));%remove7thbit
    end
end

figure;imshow(bitpr0);
title('0th bit plane removed Image');
figure;imshow(bitpr5);
title('5th bit plane removed Image');
figure;imshow(bitpr7);
title('7th bit plane removed Image');