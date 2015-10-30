function J = warp(image, H, canvas_size)
    [minX, minY, maxX, maxY] = findExtremePoints(image,H);
    J = zeros(canvas_size, canvas_size);
    for h = floor(minX):1:ceil(maxX)
        for w = floor(minY):1:ceil(maxY)
            [imageX,imageY] = mapPoint(h,w,H,0);
            J(w+canvas_size/4,h+canvas_size/4) = interp2(image,imageX,imageY);
        end
    end
end