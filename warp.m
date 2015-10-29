function J = warp(image, H)
    [minX, minY, maxX, maxY] = findExtremePoints(image,H);
    J = zeros(500, 500);
    for i = floor(minX):1:ceil(maxX)
        for j = floor(minY):1:ceil(maxY)
            [imageX,imageY] = mapPoint(i,j,H,0);
            J(j+250,i+250) = interp2(image,imageX,imageY);
        end
    end
end