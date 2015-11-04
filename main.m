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
        [low, high] = warpImageToTwoBands(center, I, canvas_size);
        peripheral_images{2*count-1} = low;
        isLowResolution(2*count-1) = 1;
        peripheral_images{2*count} = high;
        isLowResolution(2*count) = 0;
        count = count + 1;
    end
end
center_low = imgaussfilt(center, 5);
center_high = center - center_low;
center_low = offsetImage(center_low, canvas_size, 0, 0);
center_high = offsetImage(center_high, canvas_size, 0, 0);
imwrite(center_low, [output_dir 'center_low' '.' output_file_ext]);
imwrite(center_high, [output_dir 'center_high' '.' output_file_ext]);

%% Test code
% center = im2double(imread([input_dir center_image_name '.' input_file_ext]));
% canvas_size = length(center);
% count = 1;
% peripheral_images = [];
% files = dir([input_dir '*.' input_file_ext]);
% for file = files'
%     file_name = file.name;
%     if strcmp(file_name, [center_image_name '.' input_file_ext])
%         % Skip center image
%     else
%         I = imread([input_dir file_name]);
%         I = im2double(I);
%         peripheral_images{count} = I;
%         count = count + 1;
%     end
% end

[low, high] = twoBandAssembly(center_low, center_high, peripheral_images, isLowResolution, canvas_size);
imwrite(low, [output_dir 'mosaic_low' '.' output_file_ext]);
imwrite(high, [output_dir 'mosaic_high' '.' output_file_ext]);
final = low+high;
imwrite(final, [output_dir 'mosaic' '.' output_file_ext]);
