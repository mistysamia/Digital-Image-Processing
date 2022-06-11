%INPUT
img1 = imread('input1.jpg');
img2 = imread('input2.jpg');

%No of stripes and stripe size declaration
stripe = 6;
size = 100;
customSize = stripe * size;

%Resizing Images
img1 = imresize(img1, [customSize customSize]);
img2 = imresize(img2, [customSize customSize]);

% Concate and Stripe the both images
tempImage = img1;
for i = 2 : 2 : stripe
    tempImage(:, size * (i - 1) + 1 : size * i, :) = img2(:, size * (i - 1) + 1 : size * i, :);
end

%Display Images
figure;
imshow(img1);
figure;
imshow(img2);
figure;
imshow(tempImage);

% Save the New Image
imwrite(tempImage, 'output.jpg');