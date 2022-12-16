function max_Image = MaxFiltering(img)
BW = im2bw(img,0.6);
maxf = @(x)max(x(:));
max_Image = nlfilter(BW,[3 3],maxf);
end

