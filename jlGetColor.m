function colors = jlGetColor(name)
    run('jlColorLib.m');
    if ~isKey(jlColor, name)
        error("Color set '" + name + "' does NOT exist! Please check your color set name!");
    else
        colors = string(jlColor(name));
    end
end