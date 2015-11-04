function [low, high] = twoBandAssembly( center_low, center_high, peripheral_images, isLowResolution, canvas_size )
%twoBandAssembly Two Band Blending Assembly

    alpha_mask_center_high = ~isnan(center_high);
    blurred_mask_center = imgaussfilt(double(alpha_mask_center_high), 100);
    alpha_mask_center_low = blurred_mask_center .* alpha_mask_center_high;
    
    alpha_masks = {};
    for k=1:length(peripheral_images)
        image = peripheral_images{k};
        unblurred_mask = ~isnan(image);
        if isLowResolution(k) == 1
            alpha_mask = unblurred_mask;
        else
            blurred_mask = imgaussfilt(double(unblurred_mask), 100);
            alpha_mask = blurred_mask .* unblurred_mask;
        end
        alpha_masks{k} = alpha_mask;
    end
    
    low = zeros(canvas_size, canvas_size);
    high = zeros(canvas_size, canvas_size);
    [h, w] = size(low);
    for i = 1:1:h
        for j = 1:1:w
            totalMask = alpha_mask_center_low(i,j);
            totalMaskHigh = alpha_mask_center_high(i,j);
            for k=1:length(alpha_masks)
                alpha_mask = alpha_masks{k};
                if isLowResolution(k) == 1
                    totalMask = totalMask + alpha_mask(i,j);
                else
                    totalMaskHigh = totalMaskHigh + alpha_mask(i,j);
                end
            end
            if ~isnan(center_low(i,j))
                low(i,j) = alpha_mask_center_low(i,j)/totalMask * center_low(i,j);
            end
            if ~isnan(center_high(i,j))
                high(i,j) = alpha_mask_center_high(i,j)/totalMaskHigh * center_high(i,j);
            end
            for k=1:length(alpha_masks)
                alpha_mask = alpha_masks{k};
                image = peripheral_images{k};
                if ~isnan(image(i,j))
                    if isLowResolution(k) == 1
                        low(i,j) = low(i,j) + alpha_mask(i,j)/totalMask * image(i,j);
                    else
                        high(i,j) = high(i,j) + alpha_mask(i,j)/totalMaskHigh * image(i,j);
                    end
                end
            end
        end
    end
end