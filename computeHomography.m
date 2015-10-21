function H = computeHomography(peri, center)

imshow(peri)
title('select four points')
[x,y] = ginput(4);

imshow(center)
title('select four points')
[xx,yy] = ginput(4);

xy_matrix = [];
for i=1:1:4
    xy_matrix = [xy_matrix; xylayer(x(i),y(i),xx(i),yy(i))]; %#ok<*AGROW>
end

[~,~,V] = svd(xy_matrix);
h = V(:,9);
H = reshape(h,[3 3])';


end


