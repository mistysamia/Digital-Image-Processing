I = imread('back.png');
imshow(I);

[row, col,dim] = size(I);

RI = I(:,:,1);
GI = I(:,:,2);
BI = I(:,:,3);

for i = 1:row
    for j = 1:col
        if(RI(i,j,1) ==  255  && GI(i,j,1) ==  127 &&  BI(i,j,1) ==  39 )
            I(i,j,1) = 148;
            I(i,j,2) = 0;
            I(i,j,3) = 211;
        end
    end
end

figure;
imshow(I);
imwrite(I,'intermidiate2.png');


%top right
for i=100:row/2
    for  j=col/2+i:col-100
        I(i,j,:)=[255,20,147];
    end
end

%bottom left
for i = row/2:row-100
    for j=100:(i-(col/2))
        I(i,j,:) = [255,0,0];
        
    end  
end

figure;
imshow(I);
imwrite(I,'output2.png');
