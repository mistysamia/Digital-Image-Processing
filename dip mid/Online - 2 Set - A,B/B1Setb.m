I1 = imread('BW-Rose.jpg');
figure;
imshow(I1);

[row,col,dim] = size(I1);

I1 = rgb2gray(I1);

for i= 1:row
    for j=i:col
        I1(i,j,:) = 255-I1(i,j,:);
    end
end

figure;
imshow(I1);

c = zeros(1,256);

for i= 1:row
    for j=1:col
        a = I1(i,j)+1;
        c(a) = c(a)+1;
    end
end

b = 0:255;
figure;
bar(b,c,'b');
