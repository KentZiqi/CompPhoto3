function [ low, high ] = warpImageToTwoBands( main, peri, canvas_size )
    imshow(main)
    title('Select Four Points of Center Image')
    [fromX, fromY] = ginput(4);
    
    imshow(peri)
    title('Select Four Points of Peripheral Image')
    [toX, toY] = ginput(4);
   
    H = computeHomography(fromX, fromY, toX, toY);
    
    low = imgaussfilt(peri, 5);
    high = peri - low;
    
    low = applyHomographyOnImage(low, H, canvas_size);
    high = applyHomographyOnImage(high, H, canvas_size);
end

