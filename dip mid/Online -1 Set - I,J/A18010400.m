p = imread('Back.jpg');
p2 = imread('Victim.png');
 %imtool(p);
 %imtool(p2);
[row1,col1,z1] = size(p);
[row2,col2,z2] = size(p2);

S= uint8(zeros(row1,col1,z1));

disp(size(p));
disp(size(p2));

S(:,: , : ) = p(:,:, :);
%imshow(S);

val1 = 170;
val2 = 140;

for i = 1:row1
    for j = 1:col1
        
        if p2(i, j) ~= 146
            S(i,j, 1) = p2(i, j);
            S(i,j, 2) = p2(i, j);
            S(i,j, 3) = p2(i, j);
        end
        
%         if p2(i, j) <= val2
%             S(i,j, 1) = p2(i, j);
%             S(i,j, 2) = p2(i, j);
%             S(i,j, 3) = p2(i, j);
%         end
        
    end        
end

imshow(S);

% imwrite(S, 'op.png');



