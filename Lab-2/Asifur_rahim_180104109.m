I = imread('flower.png');
figure; imshow(I);
I = rgb2gray(I);
figure; imshow(I);
[r, c] = size(I);

for i = 1:r-(r/4)
    for j = 1:c
        if i>r/4 && j<c - (c/4)
            if I(i,j) >= 70
                I(i,j) = I(i,j) + (I(i,j)*0.6);
            else
                I(i,j) = I(i,j) - (I(i,j)*0.7);
            end 
        end
    end
end

figure;
imshow(I);

hist = zeros(1,256);
for i = 1:r
    for j=1:c
        hist(I(i,j)+1) = hist(I(i,j)+1)+1;
    end
end
figure;
bar(hist);
%         
% 
% l = zeros(1,256);
% 
% for i= 1:row
%     for j=1:col
%         a = O(i,j)+1;
%         l(a) = l(a)+1;
%     end
% end
% 
% b = 0:255;
% figure;
% bar(b,c,'b');
% 
% 
