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

I = rgb2gray(im2double(imread('apple.jpg')));
II = warpImage(I,I);