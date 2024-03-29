%INPUT
img1 = imread('image2.png');
img2 = imread('image1.png');

%No of stripes and stripe size declaration
stripe = 6;
size = 100;
customSize = stripe * size;

%Resizing Images
img1 = imresize(img1, [customSize customSize]);
img2 = imresize(img2, [customSize customSize]);

% Concate and Stripe the both images
tempImage = img1;
j=1;
for i = customSize/2 : 1 : customSize
    tempImage(j, 1:1:j, :) = img2(j ,customSize/2:1:i, :);
    j=j+1;
end
j=customSize/2+1;
k=customSize;
for i = customSize/2 : 1 : customSize
    tempImage(i, 1:1:j, :) = img2(i ,customSize/2:1:k, :);
    j=j-1;
    k=k-1;
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