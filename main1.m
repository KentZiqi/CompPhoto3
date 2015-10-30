clear all
close all

canvas_size = 1000;

main = rgb2gray(im2double(imread('aoi/middle.jpg')));
peri1 = rgb2gray(im2double(imread('aoi/left.jpg')));
peri2 = rgb2gray(im2double(imread('aoi/right.jpg')));
peri1 = warpImage(main, peri1, canvas_size);
peri2 = warpImage(main, peri2, canvas_size);

[h,w] = size(main);
J = zeros(canvas_size, canvas_size);
for i = 1:1:h
   for j = 1:1:w
       J(i+canvas_size/4,j+canvas_size/4) = interp2(main,j,i);
   end
end

peri1(isnan(peri1)) = 0;
peri2(isnan(peri2)) = 0;
J(isnan(J)) = 0;

I = zeros(canvas_size, canvas_size);
[h, w] = size(I);
for i = 1:1:h
    for j = 1:1:w
        if J(i,j) ~= 0
            I(i,j) = J(i,j);
        else
            if peri1(i,j) ~= 0
                I(i,j) = peri1(i,j);
            else
                I(i,j) = peri2(i,j);
            end
        end
    end
end
figure
imshow(I)

