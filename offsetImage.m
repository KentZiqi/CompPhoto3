function offsetted_image = offsetImage(image, canvas_size, additional_offset_x, additional_offset_y)
    [h,w] = size(image);
    offsetted_image = zeros(canvas_size, canvas_size);
    offset = canvas_size/3;
    for i = 1:1:h
       for j = 1:1:w
           offsetted_image(i+offset+additional_offset_y,j+offset+additional_offset_x) = image(i,j);
       end
    end
end