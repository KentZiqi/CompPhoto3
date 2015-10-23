function II = warpImage(I,J)
    imshow(I)
    title('select four points')
    [x,y] = ginput(4);

    imshow(J)
    title('select four points')
    [xx,yy] = ginput(4);
    
    H = computeHomography(x,y,xx,yy);
    II = warp(I,H);
end
