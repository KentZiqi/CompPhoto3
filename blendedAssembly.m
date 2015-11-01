function I = blendedAssembly( center, peripheral_images, canvas_size )
%blendedAssembly Summary of this function goes here
%   Detailed explanation goes here
    sigma = 10;

    center(~center) = nan;
    unblurred_mask_center = ~isnan(center);
    blurred_mask_center = imgaussfilt(double(unblurred_mask_center), sigma);
    alpha_mask_center = blurred_mask_center .* unblurred_mask_center;

    alpha_masks = []
    for k=1:length(peripheral_images)
        image = peripheral_images{k};
        unblurred_mask = ~isnan(image);
        blurred_mask = imgaussfilt(double(unblurred_mask), sigma);
        alpha_mask = blurred_mask .* unblurred_mask;
        alpha_masks{k} = alpha_mask;
    end
    
    I = zeros(canvas_size, canvas_size);
    [h, w] = size(I);
    for i = 1:1:h
        for j = 1:1:w
            totalMask = alpha_mask_center(i,j);
            for k=1:length(alpha_masks)
                alpha_mask = alpha_masks{k};
                totalMask = totalMask + alpha_mask(i,j);
            end
            I(i,j) = alpha_mask_center(i,j)/totalMask * center(i,j);
            for k=1:length(alpha_masks)
                alpha_mask = alpha_masks{k};
                image = peripheral_images{k};
                I(i,j) = I(i,j) + alpha_mask(i,j)/totalMask * image(i,j);
            end
        end
    end
end

