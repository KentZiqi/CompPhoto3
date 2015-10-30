function I = simpleAssembly( main, left, right, canvas_size )
%simpleAssembly Simple Assembly of 3 photographs
    I = zeros(canvas_size, canvas_size);
    [h, w] = size(I);
    for i = 1:1:h
        for j = 1:1:w
            if main(i,j) ~= 0
                I(i,j) = main(i,j);
            else
                if left(i,j) ~= 0
                    I(i,j) = left(i,j);
                else
                    I(i,j) = right(i,j);
                end
            end
        end
    end
end

