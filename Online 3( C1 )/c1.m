function crosscorrWindow()

clc; %% clearing the command window

%% taking inputs

%I = rgb2gray(imread('G:\CSE 4228\Lab 4\materials\input\input.jpg')); % input image with characters
%temp = rgb2gray(imread('G:\CSE 4228\Lab 4\materials\template_whole\chartemp1.jpg')); %template to be matched

S = rgb2gray(imread('treeIn.PNG')); % input image with characters
T = rgb2gray(imread('temp.png')); %template to be matched


%% converting to [0 1]

S = im2double(S);
T = im2double(T);


% taking dimensions

[sRow, sCol] = size(S);
[tRow, tCol] = size(T);


%% R is the output image with matching
R = S;

%% x and y will hold the coordinate where matching found
x = 0;
y = 0;

%% flag will be 1 whenevr matching
flag = 0;

%% We need average of templates for cross correlation formula
meanT = mean(T(:));

%% the loop :)
for i = 1:sRow - tRow % each row, but end before boundary
   for j = 1:sCol - tCol % each column, but end before boundary
       
       %% extracting the local neighbors of input image
        a = S(i : i+tRow-1 , j : j+tCol-1);
        
        %% cross correlation
        meanA = mean(a(:)); % average of the local neighbors of input image
        r1 = a - meanA; 
        r2 = T - meanT;
        c1 = r1.^2;
        c2 = r2.^2;
        c = (sum(c1(:))*sum(c2(:)))^0.5;
        t = sum(sum(r1.*r2))/c;
        
        %% evaluation to find similarity
        
        if t > 0.97
            
            disp(strcat('correlation result:',num2str(t))); % strcat() concatenates string, num2str() converts numbers to string
            
            %% holding corrdinates (i,j) where matching
            
            x = i; 
            y = j;
            
            %% setting flag
            flag = 1;
            %%
            break;
            
        end
        
   end 
   
   %% terminating outer loop
   if flag == 1
       break; 
   end
   
end


f=T;
[tx,ty]=size(f);
p2=zeros(tx,ty);

%erosion
w=[1 1 1; 1 1 1; 1 1 1];
for s=2:tx-1
    for t=2:ty-1
        w12=[f(s-1,t-1)*w(1) f(s-1,t)*w(2) f(s-1,t+1)*w(3) f(s,t-1)*w(4) f(s,t)*w(5) f(s,t+1)*w(6) f(s+1,t-1)*w(7) f(s+1,t)*w(8) f(s+1,t+1)*w(9)];
        p2(s,t)=min(w12);
    end
end

p2 = imresize(p2, [tx ty]);


%% assigning 0 to all the pixels of result image covered by the template
R(x:x+tRow-1, y:y+tCol-1) = p2(:, :, :);

%% subplotiing: ploting multiple figures in one window
figure; 
subplot(2,2,1); 
imshow(S, [0 1]);
title('Input image');

subplot(2,2,2);
imshow(T, [0 1]);
title('Template image');

subplot(2,2,3);
imshow(p2, [0 1]);
title('Eroted Template image');

subplot(2,2,4);
imshow(R, [0 1]);
title('Erosion matching result');

end

