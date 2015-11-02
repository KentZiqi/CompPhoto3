function [low,high] = separateResolution(I,hsize,gamma)
    filter = fspecial('gaussian', hsize, gamma);
    low = imfilter(I,filter);
    high = I-low;
end