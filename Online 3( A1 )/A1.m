%Taking Input
inImg=imread('pika.jpg');
subplot(2,2,1);
imshow(inImg);
title('Original Image ');

inImg=rgb2gray(inImg);
img = imbinarize(imnoise(inImg,'gaussian',0.3));
subplot(2,2,2);
imshow(img);
title('gaussian noise ');

f=img;
[x,y]=size(img);
p12=zeros(x,y);
p2=zeros(x,y);

%erosion
w=[1 1 1; 1 1 1; 1 1 1];
for s=2:x-1
    for t=2:y-1
        w12=[f(s-1,t-1)*w(1) f(s-1,t)*w(2) f(s-1,t+1)*w(3) f(s,t-1)*w(4) f(s,t)*w(5) f(s,t+1)*w(6) f(s+1,t-1)*w(7) f(s+1,t)*w(8) f(s+1,t+1)*w(9)];
        p2(s,t)=min(w12);
    end
end
subplot(2,2,3);
imshow(p2);
title('Eroded image');


for s=2:m-1
    for t=2:n-1
        if(p2(s,t)==1)
            p2(s,t)=0;
        elseif(p2(s,t)==0)
            p2(s,t)=1;
        end

    end
end
subplot(2,2,4);
imshow(p2);
title('Enhanched Outline');
