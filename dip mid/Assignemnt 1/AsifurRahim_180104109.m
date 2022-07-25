I = imread('input.jpg');
I=imresize(I,[720,720]);
figure; 
imshow(I);

[row, col,n] = size(I);
K = uint8(zeros(row, col,n));
r=1;
c=col;
%image flipping
for i = 1:row
  for j = 1:col
  
 K(i,j,:) = I(r,c,:);
  c=c-1;
 end
 r=r+1;
 c=col;
 end

  figure; imshow(K);

  imwrite(K, 'F:\sem 4.2\dip lab\matlab exmaple\flipped.jpg');

  
 %copying the actual image to another blank image 
 L=uint8(ones(row, col+col,n));
 for i = 1:row
   for j = 1:col
     L(i,j,:)=L(i,j,:)+I(i,j,:);
     
   end
 end
 
 b=1;
 s=col+1;
 
 for i = 1:row
   s=col+1;
  for j = 1:col
    L(b,s,:)=L(b,s,:)+K(i,j,:);
    s=s+1;
  end
  b=b+1;
  
end
  figure; imshow(L);
 %save image 
imwrite(L, 'F:\sem 4.2\dip lab\matlab exmaple\output.jpg');
