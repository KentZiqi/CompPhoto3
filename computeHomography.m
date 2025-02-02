function H = computeHomography(x, y, xx, yy)
    xy_matrix = [];
    for i=1:1:4
        xy_matrix = [xy_matrix; computeHomographyAux(x(i),y(i),xx(i),yy(i))];
    end

    [~,~,V] = svd(xy_matrix);
    h = V(:,9);
    H = reshape(h,[3 3])';
end

