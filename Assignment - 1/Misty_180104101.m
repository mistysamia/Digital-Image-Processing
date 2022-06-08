%%%%%%%%%%%     Input    %%%%%%%%%%%  
image = imread('input.jpg');
figure;
imshow(image);

%%%%%%%%%%%  Flipped  %%%%%%%%%%%  
flipped =image(:, end : -1 : 1, :);
figure;
imshow(flipped);

%%%%%%%%%%%  Merge  %%%%%%%%%%%  
newImage = [image flipped];
figure;
imshow(newImage);

%%%%%%%%%%%  Output  %%%%%%%%%%%  
imwrite(newImage, 'output.jpg');
