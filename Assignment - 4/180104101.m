se = strel('disk', 30);
row = 680;
col = 742;
s = 150;

titles = {'Original', 'Binary Image', 'Palm', 'Fingers (Noisy)', 'Fingers (Noiseless)', 'Number of Finger'};

fig = figure('WindowState','maximized');

for i = 1 : 5
    I = imread(strcat('f', int2str(i), '.png'));
    
    %1. Original Image
    Images{1} = I;
    
    %2. Binary Image
    if size(I, 3) == 3
         I = rgb2gray(I);
    end
    I = imbinarize(I);
    Images{2} = I;
    
    %3. Palm Image
    Images{3} = imdilate(imerode(I, se), se);
    %4. Fingers (Noisy)
    Images{4} = Images{2} - Images{3};
    %5. Fingers (Noiseless)
    Images{5} = imfill(bwareaopen(Images{4}, 1000), 'holes');
    %6. Count no of Fingers
    [~, cnt] = bwlabel(Images{5});
    Images{6} = insertText(white, [(row / 2) - (s / 2), (col / 2) - s], ...
        int2str(cnt), 'FontSize', s, 'BoxOpacity', 0.0);
    
    %SUBPLOT
    for j = 1 : 6
        subplot(5, 6, (i - 1) * 6 + j);
        imshow(Images{j}); 
        title(titles{j});
    end
end
saveas(fig, 'output', 'jpg');
clc;
