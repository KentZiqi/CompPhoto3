function peri = warpImage(main,peri)
    %imshow(main)
    %title('Select Four Points of Center Image')
    %[fromX, fromY] = ginput(4);
    
    %imshow(peri)
    %title('Select Four Points of Peripheral Image')
    [toX, toY] = ginput(4);
   
    H = computeHomography(fromX, fromY, toX, toY);
    
    peri = warp(peri, H);
end
