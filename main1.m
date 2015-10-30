clear all
close all

canvas_size = 1000;

main = rgb2gray(im2double(imread('aoi/middle.jpg')));
peri1 = rgb2gray(im2double(imread('aoi/left.jpg')));
peri2 = rgb2gray(im2double(imread('aoi/right.jpg')));

peri1 = warpImage(main, peri1, canvas_size);
peri2 = warpImage(main, peri2, canvas_size);
main = warpMain(main, canvas_size, 0, 0);

main(isnan(main)) = 0;
peri1(isnan(peri1)) = 0;
peri2(isnan(peri2)) = 0;

I = simpleAssembly(main, peri1, peri2, canvas_size);
figure
imshow(I)

