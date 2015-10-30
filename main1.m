clear all
close all

%figure
%title('select four points')
%[x,y] = ginput(4);

%title('select four points')
%[xx,yy] = ginput(4);

%x = [0 0 1 1]';
%y = [0 1 0 1]';

%xx = [0 0.5 1 1.5]';
%yy = [0 1 0 1]';
%H = computeHomography(x,y,xx,yy);

%[w,h]=findExtremePoints(zeros(20,20),H);

main = rgb2gray(im2double(imread('apple_center.jpg')));
peri1 = rgb2gray(im2double(imread('apple_left.jpg')));
peri2 = rgb2gray(im2double(imread('apple_right.jpg')));
%peri1 = warpImage(main, peri1);
%peri2 = warpImage(main, peri2);

fromX = [11.0461; 1.7908; 3.8475; 18.6560];
fromY = [8.4184; 9.2411; 53.8723; 50.1702];
toX = [36.2137; 27.3431; 29.8451; 44.4020];
toY = [8.1196; 9.2569; 54.0647; 49.9706];
H = computeHomography(fromX, fromY, toX, toY);
peri1 = warp(peri1, H);

fromX = [23; 23; 37; 37];
fromY = [0; 58; 58; 0];
toX = [1; 1; 17; 17];
toY = [0; 58; 58; 0];
H = computeHomography(fromX, fromY, toX, toY);
peri2 = warp(peri2, H);

[h,w] = size(main);
J = zeros(500, 500);
for i = 1:1:h
   for j = 1:1:w
       J(i+250,j+250) = interp2(main,j,i);
   end
end

peri1(isnan(peri1)) = 0;
peri2(isnan(peri2)) = 0;
J(isnan(J)) = 0;
I = peri1+peri2+J;
figure
imshow(I)

