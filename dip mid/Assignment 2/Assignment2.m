I = imread('peppers_color.jpg');
I = rgb2gray(I);
[row,col] = size(I);
R=I;
I=de2bi(double(I));

c1=I(:,1);
c2=I(:,2);
c3=I(:,3);
c4=I(:,4);
c5=I(:,5);
c6=I(:,6);
c7=I(:,7);
c8=I(:,8);

k1=reshape(c1,row,col);
k2=reshape(c2,row,col);
k3=reshape(c3,row,col);
k4=reshape(c4,row,col);
k5=reshape(c5,row,col);
k6=reshape(c6,row,col);
k7=reshape(c7,row,col);
k8=reshape(c8,row,col);


X = ones(1, 8);

for i = 1 : 8
    X(i) = 2 ^ (i - 1);
end

s1=zeros(row,col);
s2=zeros(row,col);
s3=zeros(row,col);
s4=zeros(row,col);
s5=zeros(row,col);
s6=zeros(row,col);
s7=zeros(row,col);
s8=zeros(row,col);

for i=1:row
    for j=1:col
        s1(i,j)=bitand(R(i,j),X(1));
        s2(i,j)=bitand(R(i,j),X(2));
        s3(i,j)=bitand(R(i,j),X(3));
        s4(i,j)=bitand(R(i,j),X(4));
        s5(i,j)=bitand(R(i,j),X(5));
        s6(i,j)=bitand(R(i,j),X(6));
        s7(i,j)=bitand(R(i,j),X(7));
        s8(i,j)=bitand(R(i,j),X(8));
    end
end    


figure
subplot(2, 4, 1);
imshow(s1); title('LSB Bit Plane');
subplot(2, 4, 2);
imshow(s2); title('2nd Bit Plane');
subplot(2, 4, 3);
imshow(s3); title('3rd Bit Plane');
subplot(2, 4, 4);
imshow(s4); title('4th Bit Plane');
subplot(2, 4, 5);
imshow(s5); title('5th Bit Plane');
subplot(2, 4, 6);
imshow(s6); title('6th Bit Plane');
subplot(2, 4, 7);
imshow(s7); title('7th Bit Plane');
subplot(2, 4, 8);
imshow(s8); title('MSB Bit Plane');
