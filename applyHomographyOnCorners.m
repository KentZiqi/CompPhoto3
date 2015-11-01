function [minX, minY, maxX, maxY] = applyHomographyOnCorners(I, H)
    [x,y] = size(I);
    corners = [1 1; 1 x; y 1; y x];
    new_corners = [];
    for i=1:1:4
        [px, py]= applyHomographyOnPoints(corners(i,1),corners(i,2),H,1);
        new_corners = [new_corners; px py];
    end
    minX = ceil(min(new_corners(:,1)));
    minY = ceil(min(new_corners(:,2)));
    maxX = ceil(max(new_corners(:,1)));
    maxY = ceil(max(new_corners(:,2)));
end