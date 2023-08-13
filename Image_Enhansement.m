
%pic = imread("import your wish including picture path");


gray_image = 0.299 * pic(:,:,1) + 0.587 * pic(:,:,2) + 0.114 * pic(:,:,3);

figure,imshow(gray_image);


negative_image = 255 - gray_image;
figure,imshow(negative_image);


c = 3;
log_transformed = c * log(1 + double(gray_image));
log_transformed = (255 / max(log_transformed(:))) * log_transformed;
log_transformed = uint8(log_transformed);
figure,imshow(log_transformed);


gray_image = imread('C:\\Users\\HP\\Downloads\\heat_map.jpg');
color_image = zeros(size(gray_image, 1), size(gray_image, 2), 3, 'uint8');
color_mappings = [28, 163, 64; 32, 19, 214; 140, 14, 90];
for i = 1:size(gray_image, 1)
    for j = 1:size(gray_image, 2)
        intensity = gray_image(i, j);
        if intensity <= 50
            color_image(i, j, :) = color_mappings(1, :);
        elseif intensity <= 150
            color_image(i, j, :) = color_mappings(2, :);
        else
            color_image(i, j, :) = color_mappings(3, :);
        end
    end
end
figure,imshow(color_image);



f = [2 6 6 4 4; 3 2 6 2 4; 2 4 6 2 3; 3 4 2 2 3; 4 6 6 6 4];


histogram = zeros(8, 1);

for i = 1:size(f, 1)
    for j = 1:size(f, 2)
        intensity = f(i, j);  % Get the intensity value
        histogram(intensity + 1) = histogram(intensity + 1) + 1;
    end
end

figure,bar(0:7, histogram);
xlabel('Intensity');
ylabel('Frequency');


total_pixels = numel(f);
histogram_normalized = histogram / total_pixels;
cdf = cumsum(histogram_normalized);

equalized_f = zeros(size(f));
for i = 1:size(f, 1)
    for j = 1:size(f, 2)
        intensity = f(i, j);  % Get the intensity value
        equalized_f(i, j) = round(cdf(intensity + 1) * 7);
    end
end

figure,imshow(equalized_f, [0 7]);



min_intensity = min(equalized_f(:));
max_intensity = max(equalized_f(:));
stretched_f = zeros(size(equalized_f));
for i = 1:size(equalized_f, 1)
    for j = 1:size(equalized_f, 2)
        intensity = equalized_f(i, j);  % Get the intensity value
        stretched_f(i, j) = (intensity - min_intensity) * (7 / (max_intensity - min_intensity));
    end
end

figure,imshow(stretched_f, [0 7]);










