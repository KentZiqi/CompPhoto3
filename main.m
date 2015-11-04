clear all
close all

%% Configure variables here
center_image_name = 'middle';
input_dir = 'aoi/';
output_dir = './out/'; % Make sure you have mkdir'ed this directory
input_file_ext = 'jpg';
output_file_ext = 'tif';
canvas_scale_of_center_image = 4; % Canvas size will be this times size of center image


center = rgb2gray(im2double(imread([input_dir center_image_name '.' input_file_ext])));
canvas_size = length(center) * canvas_scale_of_center_image;
files = dir([input_dir '*.' input_file_ext]);
peripheral_images = [];
isLowResolution = [];
count = 1;
for file = files'
    file_name = file.name;
    if strcmp(file_name, [center_image_name '.' input_file_ext])
        % Skip center image
    else
        I = imread([input_dir file_name]);
        I = rgb2gray(im2double(I));
        
        %% For Simple and Blended Assembly
        I = warpImage(center, I, canvas_size);
        imwrite(I, [output_dir 'peri_' num2str(count) '.' output_file_ext]);
        peripheral_images{count} = I;

        %% For Two Banded Assembly (When using this, comment out Simple and Blended Assembly part above)
%         [low, high] = warpImageToTwoBands(center, I, canvas_size);
%         peripheral_images{2*count-1} = low;
%         isLowResolution(2*count-1) = 1;
%         peripheral_images{2*count} = high;
%         isLowResolution(2*count) = 0;
%         imwrite(low, [output_dir 'peri_low_' num2str(count) '.' output_file_ext]);
%         imwrite(high, [output_dir 'peri_high_' num2str(count) '.' output_file_ext]);
        
        count = count + 1;
    end
end

%% For Simple and Blended Assembly
center = offsetImage(center, canvas_size, 0, 0);
imwrite(center, [output_dir 'center' '.' output_file_ext]);

%% For Two Banded Assembly (When using this, comment out Simple and Blended Assembly part above)
% center_low = imgaussfilt(center, 5);
% center_high = center - center_low;
% center_low = offsetImage(center_low, canvas_size, 0, 0);
% center_high = offsetImage(center_high, canvas_size, 0, 0);
% imwrite(center_low, [output_dir 'center_low' '.' output_file_ext]);
% imwrite(center_high, [output_dir 'center_high' '.' output_file_ext]);

%% For Simple and Blended Assembly
final = simpleAssembly(center, peripheral_images, canvas_size);
% final = blendedAssembly(center, peripheral_images, canvas_size);
imwrite(final, [output_dir 'mosaic_final' '.' output_file_ext]);

%% For Two Banded Assembly (When using this, comment out Simple and Blended Assembly part above)
% [low, high] = twoBandAssembly(center_low, center_high, peripheral_images, isLowResolution, canvas_size);
% final = low+high;
% imwrite(low, [output_dir 'mosaic_low' '.' output_file_ext]);
% imwrite(high, [output_dir 'mosaic_high' '.' output_file_ext]);
% imwrite(final, [output_dir 'mosaic' '.' output_file_ext]);
