a = imread('tree.PNG');
a = rgb2gray(a);


figure
subplot (2,3,1)
imshow(a);
title('Orginal image');


[r,c] = size(a);
newImg = uint8(zeros(r,c));

for i=1:r-5
    for j=1:c-5
        B = a(i:i+5, j:j+5);
        newImg(i+1,j+1) = median(B(:));
    end
end

newImg = imbinarize(newImg);

newImg = padarray(newImg,[1 1],0,'both');

SE = strel('disk',15);
SE = SE.getnhood(); 
newImg2 = newImg;

a1=imdilate(newImg,SE);
a2=imerode(a1,SE);

subplot (2,3,2)
imshow(newImg);
title('Noise Removed image');

subplot (2,3,3)
imshow(a1);
title('Dilated image');

subplot (2,3,4)
imshow(a2);
title('Eroded image');

newImg = ~a2;
subplot (2,3,5)
imshow(newImg);
title('Output image');



