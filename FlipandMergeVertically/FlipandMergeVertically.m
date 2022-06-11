%Taking Input
inImg = imread('input.jpg');
figure;
imshow(inImg);

%Flip the input image
flipImg =inImg(end:-1:1, :, :);
figure;
imshow(flipImg);

%Concate both images
outImg = [inImg ; flipImg];
figure;
imshow(outImg);

%Save the image
imwrite(outImg, 'output.jpg');