input=imread('flower.png');
I=rgb2gray(input);
I=im2double(I);
figure;
imshow(I);
[r,c]=size(I);
O=double(zeros(r,c));
k=r;

for i=1:r
    for j=1:c
        if i<2/3*k && j>c/2 
            O(i,j) = 1/0.5*log(1+I(i,j));
             
        elseif i>r/4 && j<c/2
            
            
             O(i,j) =  2*(I(i,j).^3);
            
        else
            O(i,j)=I(i,j);
        end
    end
end       
figure;              
imshow(O);

