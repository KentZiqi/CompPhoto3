clear all
close all

canvas_size = 1500;

main = rgb2gray(im2double(imread('apple/middle.jpg')));
peri1 = rgb2gray(im2double(imread('apple/left.jpg')));
peri2 = rgb2gray(im2double(imread('apple/right.jpg')));

peri1 = warpImage(main, peri1, canvas_size);
peri2 = warpImage(main, peri2, canvas_size);
main = warpMain(main, canvas_size, 0, 0);
figure
imshow(peri1)
figure
imshow(peri2)
figure
imshow(main)

main(isnan(main)) = 0;
peri1(isnan(peri1)) = 0;
peri2(isnan(peri2)) = 0;

I = simpleAssembly(main, peri1, peri2, canvas_size);
figure
imshow(I)

