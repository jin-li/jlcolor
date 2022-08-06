function jlAddColor(colors, name)

libFile = which('jlColorLib');

run(libFile);
if isKey(jlColor, name)
    error("Color scheme '" + name + "' already exists! Please use another name!");
else
    fout = fopen(libFile,'a+');
    fprintf(fout,"jlColor('" + string(name) + "') = [");
    for i=1:length(colors)
        fprintf(fout, "'" + colors(i) + "'");
        if i < length(colors)
            fprintf(fout, "; ");
        else
            fprintf(fout, "];\n");
        end
    end
    fclose(fout);
    jlShowColor(name);
end
end
