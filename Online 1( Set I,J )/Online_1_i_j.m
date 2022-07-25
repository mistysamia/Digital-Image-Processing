


I1 = imread('Victim.png');
figure;
imshow(I1);

I2 = imread('redBack.jpg');
figure;
imshow(I2);

%I4 = imread('redBack.jpg');


[row, col, channel] = size(I2);

I3 = cat(3,I1,I1,I1);

for i = 1:row
    for j = 1:col
        if(I3(i,j,1) >=  140 && I3(i,j,1) <= 150)
            I3(i,j,1) = I2(i,j,1);
        end
        if(I3(i,j,2) >=  140 && I3(i,j,2) <= 150)
            I3(i,j,2) = I2(i,j,2);
        end
        if(I3(i,j,3) >=  140 && I3(i,j,3) <= 150)
            I3(i,j,3) = I2(i,j,3);
        end
    end
end
figure;
imshow(I3);

imwrite(I3,'output2.png');