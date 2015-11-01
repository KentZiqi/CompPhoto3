clear all
close all

center_image_name = 'middle';
input_dir = 'window/';
output_dir = './out/';
input_file_ext = 'jpg';
output_file_ext = 'tif';

center = rgb2gray(im2double(imread([input_dir center_image_name '.' input_file_ext])));
canvas_size = length(center) * 5;
files = dir([input_dir '*.' input_file_ext]);
peripheral_images = [];
count = 1;
for file = files'
    file_name = file.name;
    if strcmp(file_name, [center_image_name '.' input_file_ext])
        % Skip center image
    else
        I = imread([input_dir file_name]);
        I = rgb2gray(im2double(I));
        I = warpImage(center, I, canvas_size);
        I(isnan(I)) = 0;
        imwrite(I, [output_dir file_name(1:end-3) output_file_ext]);
        peripheral_images{count} = I;
        count = count + 1;
    end
end
center = offsetImage(center, canvas_size, 0, 0);
imwrite(center, [output_dir 'middle' '.' output_file_ext]);

I = simpleAssembly(center, peripheral_images, canvas_size);
figure
imshow(I)

%save('images');

