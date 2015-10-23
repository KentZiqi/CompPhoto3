function [width, height] = findExtremePoints(I, H)
    [x,y] = size(I);
    corners = [0 0;x 0; 0 y; x y];
    new_corners = [];
    for i=1:1:4
        [px, py]= mapPoint(corners(i,1),corners(i,2),H,0);
        new_corners = [new_corners; px py];
    end
    width = ceil(max(new_corners(:,1)));
    height = ceil(max(new_corners(:,2)));
end