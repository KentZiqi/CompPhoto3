function I = simpleAssembly( main, peripheral_images, canvas_size )
%simpleAssembly Simple Assembly of images
    I = zeros(canvas_size, canvas_size);
    [h, w] = size(I);
    for i = 1:1:h
        for j = 1:1:w
            if main(i,j) ~= 0
                I(i,j) = main(i,j);
            else
                for k=1:length(peripheral_images)
                    image = peripheral_images{k};
                    if image(i,j) ~= 0
                        I(i,j) = image(i,j);
                    end
                end
            end
        end
    end
end

