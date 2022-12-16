%{
%%HomomorphicFiltering -> filtered_image_sharpening
clc
close all
D0 = 20;
gammaL = 0.999;
gammaH = 3.0;
type = 'butterworth';
n = 2;

if ~exist('result', 'dir')
    mkdir('result')
end

I = imread('n_img.jpg');
filtered_image_homomorphic = HomomorphicFiltering(I, D0, gammaL, gammaH, type, n);

filtered_image_sharpening = imsharpen(filtered_image_homomorphic,'Radius',2,'Amount',1);
imshow(filtered_image_sharpening)
%}

%{
%%HomomorphicFiltering -> filtered_image_sharpening ->normalize
clc
close all
D0 = 20;
gammaL = 0.999;
gammaH = 3.0;
type = 'butterworth';
n = 2;

if ~exist('result', 'dir')
    mkdir('result')
end

I = imread('n_img.jpg');
filtered_image_homomorphic = HomomorphicFiltering(I, D0, gammaL, gammaH, type, n);

filtered_image_sharpening = imsharpen(filtered_image_homomorphic,'Radius',2,'Amount',1);
normImage = im2double(filtered_image_sharpening);
imshow(normImage)
%}


