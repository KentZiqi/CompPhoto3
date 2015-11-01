function warped_image = applyHomographyOnImage(image, H, canvas_size)
    [minX, minY, maxX, maxY] = applyHomographyOnCorners(image,H);
    X = floor(minX):1:ceil(maxX);
    Y = floor(minY):1:ceil(maxY);
    [XX,YY] = reshapePoints(X,Y);
    [XX,YY] = applyHomographyOnPoints(XX,YY,H,0);
    J = interp2(image,XX,YY);
    J = reshape(J,[length(Y),length(X)]);
    warped_image = offsetImage(J, canvas_size, minX, minY);
end