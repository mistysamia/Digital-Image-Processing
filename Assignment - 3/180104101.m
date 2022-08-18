Input=rgb2gray(imread('input_image.jpg'));

prompt='Enter value of sigma: ';
sg = input(prompt);

%Kernel Initialization
sum_k = 0;
KN = ones(5,5);
for i = 1:5
    for j= 1:5
        dist = (i-3)^2 + (j-3)^2;
        KN(i,j) = exp((-1*dist) / (2*sg*sg));
        sum_k = sum_k + KN(i,j);
    end
end
KN = KN/sum_k;

[r, c] = size(Input);
outputImage = zeros(r,c);
%Add padding
padding= padarray(Input, [2,2]);

%Gaussian Filter Applying
for i = 1: r
    for j= 1: c
        temp = double(padding(i:i+4, j:j+4));
        filt  = temp.*KN;
        outputImage(i,j) = sum(filt(:));
    end
end

outputImage = uint8(outputImage);
imwrite('Output_image',outputImage);
figure;
subplot(1,2,1);
imshow(Input);
title('Input');

subplot(1,2,2);
imshow(outputImage);
title('Output');



