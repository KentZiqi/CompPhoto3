clear all
close all

%% Configure variables here
center_image_name = 'middle';
input_dir = 'out/';
output_dir = './new_out/'; % Make sure you have mkdir'ed this directory
input_file_ext = 'tif';
output_file_ext = 'tif';
canvas_scale_of_center_image = 5; % Canvas size will be this times size of center image

%% Don't touch below here
% center = rgb2gray(im2double(imread([input_dir center_image_name '.' input_file_ext])));
% canvas_size = length(center) * canvas_scale_of_center_image;
% files = dir([input_dir '*.' input_file_ext]);
% peripheral_images = [];
% count = 1;
% for file = files'
%     file_name = file.name;
%     if strcmp(file_name, [center_image_name '.' input_file_ext])
%         % Skip center image
%     else
%         I = imread([input_dir file_name]);
%         I = rgb2gray(im2double(I));
%         I = warpImage(center, I, canvas_size);        
%         imwrite(I, [output_dir file_name(1:end-3) output_file_ext]);
%         peripheral_images{count} = I;
%         count = count + 1;
%     end
% end
% center = offsetImage(center, canvas_size, 0, 0);
% imwrite(center, [output_dir 'middle' '.' output_file_ext]);

%% Test code
center = im2double(imread([input_dir center_image_name '.' input_file_ext]));
canvas_size = length(center);
count = 1;
peripheral_images = [];
files = dir([input_dir '*.' input_file_ext]);
for file = files'
    file_name = file.name;
    I = imread([input_dir file_name]);
    I = im2double(I);
    peripheral_images{count} = I;
    count = count + 1;
end

I = blendedAssembly(center, peripheral_images, canvas_size);
imwrite(I, [output_dir 'mosaic' '.' output_file_ext]);