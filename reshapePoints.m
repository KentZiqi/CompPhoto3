function [XX,YY] = reshapePoints(X,Y)
%reshapePoints Creates two arrays XX and YY where (XX(i), YY(j)) represent a point on the peripheral image
%   This function is used so that multiple points can be passed into interp2
%   in applyHomographyOnImage.m at once. Hence, we can avoid a for loop in warp.m that
%   interp2's pixel by pixel.
    s1 = length(X);
    s2 = length(Y);
    x_offset = min(X);
    XX = zeros(1,s1*s2);
    for i = 1:1:s1
        XX(1, (i-1)*s2+1:i*s2) = i+x_offset;
    end
    YY = repmat(Y,1,s1);
end