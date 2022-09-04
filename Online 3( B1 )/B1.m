%Taking Input
inImg=imread('angrybird.jpg');
subplot(2,2,1);
imshow(inImg);
title('Original Image ');


inImg=rgb2gray(inImg);
L = imnoise(inImg,'salt & pepper');
K=imbinarize(L);

subplot(2,2,2);
imshow(K);
title('salt & pepper ');
p2=K;
[x,y]=size(K);
p12=zeros(x,y);

[m,n]=size(p2);
w=[1 1 1; 1 1 1; 1 1 1];
for s=2:m-1
    for t=2:n-1
        w13=[p2(s-1,t-1)*w(1) p2(s-1,t)*w(2) p2(s-1,t+1)*w(3) p2(s,t-1)*w(4) p2(s,t)*w(5) p2(s,t+1)*w(6) p2(s+1,t-1)*w(7) p2(s+1,t)*w(8) p2(s+1,t+1)*w(9)];
        p12(s,t)=max(w13);
    end
end
subplot(2,2,3);
imshow(p12);
title('Removed Noise');


for s=2:m-1
    for t=2:n-1
        if(p12(s,t)==1)
            p12(s,t)=0;
        elseif(p12(s,t)==0)
            p12(s,t)=1;
        end

    end
end
subplot(2,2,4);
imshow(p12);
title('Dimished Outline');
