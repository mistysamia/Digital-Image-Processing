I = imread('back.png');
imshow(I);

[row, col,dim] = size(I);

RI = I(:,:,1);
GI = I(:,:,2);
BI = I(:,:,3);

for i = 1:row
    for j = 1:col
        if(RI(i,j,1) ==  181  && GI(i,j,1) ==  230 &&  BI(i,j,1) ==  29 )
            I(i,j,1) = 0;
            I(i,j,2) = 0;
            I(i,j,3) = 255;
        end
    end
end

figure;
imshow(I);
imwrite(I,'intermidiate.png');


% top left
for i =100:row/2
    for j=100:((col/2)-i)
        I(i,j,:) = [0,255,0];
        
    end
end

%bottom right
for i = row/2 : row-100
    for  j=col - i + row/2:col-100
        I(i,j,:) = [255,255,0];
    end
end

figure;
imshow(I);
