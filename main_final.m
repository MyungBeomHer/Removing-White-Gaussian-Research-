%%결론은 HomomorphicFiltering -> unsharp mask
clc;
close all;
clear all;
D0 = 20;
gammaL = 0.999;
gammaH = 3.0;
type = 'butterworth';
n = 2;

if ~exist('result', 'dir')
    mkdir('result')
end

I = imread('n_img.jpg');

%{
%%HighFrequencyEmphasisFiltering
k1 = 1.5;
k2 = 1.75;
type = 'butterworth';
D0 = 70;
n = 2;

if ~exist('result', 'dir')
    mkdir('result')
end

filtered_image_highpassemphasis = HighFrequencyEmphasisFiltering(I, k1, k2, type, D0, n);
imshow(filtered_image_highpassemphasis)
%}

filtered_image_homomorphic = HomomorphicFiltering(I, D0, gammaL, gammaH, type, n);
%imshow(filtered_image_homomorphic)

%K = wiener2(filtered_image_homomorphic,[5 5]);
%normImage = im2double(filtered_image_homomorphic,'indexed');

%%unsharp mask 


filtered_image_sharpening = imsharpen(filtered_image_homomorphic,'Radius',2,'Amount',1);
%imshow(filtered_image_sharpening)

%%normalize
%normImage = im2double(filtered_image_sharpening,'indexed');
%imshow(normImage)

%%low_pass filter 
%low_pass_image = LPF(filtered_image_sharpening, 600,"Gaussian");
%imshow(low_pass_image)



%%HighFrequencyEmphasisFiltering
%{
k1 = 1.5;
k2 = 1.75;
type = 'butterworth';
D0 = 70;
n = 2;

filtered_image_highpassemphasis = HighFrequencyEmphasisFiltering(filtered_image_sharpening, k1, k2, type, D0, n);
%}
%%min_filter
localMinImage = imerode(filtered_image_sharpening, true(3));
imshow(localMinImage)

%%max_filter
%localMaxImage = imdilate(localMinImage, true(3));
%%
%imshow(localMaxImage)





