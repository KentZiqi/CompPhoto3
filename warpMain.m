function J = warpMain(main, canvas_size, offset_x, offset_y)
    [h,w] = size(main);
    J = zeros(canvas_size, canvas_size);
    for i = 1:1:h
       for j = 1:1:w
           J(i+canvas_size/4+offset_y,j+canvas_size/4+offset_x) = interp2(main,j,i);
       end
    end
end