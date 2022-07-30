function jlAddColorFromImage(image_file, name)

colors = getImageColor(image_file);
jlAddColor(colors, name);

end