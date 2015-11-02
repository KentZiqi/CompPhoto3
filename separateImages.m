function [imagesSeparated, isLowResolution] = separateImages(images)
    imagesSeparated = {};
    isLowResolution = [];
    for k=1:length(images)
        image = images{k};
        [low,high] = separateResolution(image,100,5);
        imagesSeparated{2*k-1} = low;
        isLowResolution(2*k-1) = 1;
        imagesSeparated{2*k} = high;
        isLowResolution(2*k) = 0;       
    end
end