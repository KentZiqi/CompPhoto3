%figure
%title('select four points')
%[x,y] = ginput(4);

%title('select four points')
%[xx,yy] = ginput(4);

x = [10 20 10 20]';
y = [10 10 20 20]';

xx = [10 20 15 25]';
yy = [10 10 20 20]';
H = computeHomography(x,y,xx,yy);