I=imread('cameraman.png');
figure;
imshow(I);
a= rgb2gray(I)
[row,col]=size(I);
X=zeros(1,256);
Y=zeros(1,256);

for i=1:row
    for j=1:col
               temp=I(i,j)+1;
               X(temp)=X(temp)+1;   
    end
end
figure;
bar(X);
title('Hist plot')
xlabel('1 to 256 pixel values')
ylabel('frequency')

