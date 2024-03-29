img1 = imread('turkey.jpg');
[row, col, dim] = size(img1);
img2 = zeros(row, col);
img2 = cat(3,img2,img2,img2);

A = 0;
B = 0;
C = 0;

for i = 1 : row
    for j= 1:col
        A = img1(i, j, 1);
        B = img1(i, j, 2);
        C = img1(i, j, 3);
        if A>200 && A<=255 &&  B>200 && B<=255 &&  C>200 && C<=255 
           img2(i, j, 1) = 0;
           img2(i, j, 2) = 255;
           img2(i, j, 3) = 255;
        end
    end
end


%Display Images
figure;
imshow(img2);

% Save the New Image
imwrite(img2, 'output.jpg');