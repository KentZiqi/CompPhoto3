clear all
close all

canvas_size = 500;

main = rgb2gray(im2double(imread('apple/middle.jpg')));
peri1 = rgb2gray(im2double(imread('apple/left.jpg')));
peri2 = rgb2gray(im2double(imread('apple/right.jpg')));

fromX = [11.0461; 1.7908; 3.8475; 18.6560];
fromY = [8.4184; 9.2411; 53.8723; 50.1702];
toX = [36.2137; 27.3431; 29.8451; 44.4020];
toY = [8.1196; 9.2569; 54.0647; 49.9706];
H = computeHomography(fromX, fromY, toX, toY);
peri1 = warp(peri1, H, canvas_size);

fromX = [23; 23; 37; 37];
fromY = [0; 58; 58; 0];
toX = [1; 1; 17; 17];
toY = [0; 58; 58; 0];
H = computeHomography(fromX, fromY, toX, toY);
peri2 = warp(peri2, H, canvas_size);

main = warpMain(main, canvas_size);

main(isnan(main)) = 0;
peri1(isnan(peri1)) = 0;
peri2(isnan(peri2)) = 0;

I = simpleAssembly(main, peri1, peri2, canvas_size);
figure
imshow(I)

