function colors = getImageColor(image_file)

img = imread(image_file);
fig = figure;
imshow(img);
disp('Click on the image to get color.');
disp('Press Enter to finish.');
[y,x] = getpts;
c = zeros(length(x),3);
for i = 1:length(x)
    c(i,:) = img(int16(x(i)),int16(y(i)),:);
end
close(fig);

% convert rgb to hex
colors = string(rgb2hex(c));

end