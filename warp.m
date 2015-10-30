function J = warp(peri, H)
    [minX, minY, maxX, maxY] = findExtremePoints(peri,H);
    J = zeros(500, 500);
    for mainX = floor(minX):1:ceil(maxX)
        for mainY = floor(minY):1:ceil(maxY)
            [periX,periY] = mapPoint(mainX,mainY,H,0);
            J(mainY+250,mainX+250) = interp2(peri,periX,periY);
        end
    end
end