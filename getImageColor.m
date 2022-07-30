function colors = getImageColor(image_file)

A = imread(image_file);
fig = figure;
imshow(A);
disp('Click on the image to get color.');
disp('Press Enter to finish.');
[y,x] = getpts;
COLOR = zeros(length(x),3);
for i = 1:length(x)
    COLOR(i,:) = A(int16(x(i)),int16(y(i)),:);
end
close(fig);

% convert rgb to hex
colors = string(rgb2hex(COLOR));

end

