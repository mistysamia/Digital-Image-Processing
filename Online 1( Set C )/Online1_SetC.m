img1 = imread('colorful_back.png');
figure;
imshow(img1);
img2 = imread('red_shades.png');
figure;
imshow(img2);


stripe = 6;
size = 100;
customSize = stripe * size;

%Resizing Images
img1 = imresize(img1, [customSize customSize]);
img2 = imresize(img2, [customSize customSize]);

tempImage = img2;

j=customSize;
for i = 1 : 1 : customSize
    tempImage(j, 1:1:customSize, :) = img2(i ,1:1:customSize, :);
    j=j-1;
end

j=400;
for i = 1 : 1 : customSize
    img1(i, 200:1:j , :) = tempImage(i, 200:1:j , :);
    j=j-1;
end
j=200;
for i = 1 : 1 : customSize
    img1(i, j:1:400 , :) = tempImage(i, j:1:400 , :);
    j=j+1;
end

%Display Images
figure;
imshow(img1);

% Save the New Image
imwrite(tempImage, 'output.jpg');