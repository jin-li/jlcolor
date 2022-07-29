function colors = jlGetColor(name)
    run('jlColorLib.m');
    colors = string(jlColor(name));
end