I=imread('G:\CSE 4228\Lab2_mine\cameraman.png');
%imshow(I);

[row,col]=size(I);
X=zeros(1,256);

for i=1:row
    for j=1:col
               temp=I(i,j)+1;
               X(temp)=X(temp)+1;
          
    end
end
bar(X);