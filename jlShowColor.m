function jlShowColor(name)

run('jlColorLib.m');
if strcmp(name, 'all')
    k = keys(jlColor);
    ncolor = length(k); % number of goups of color
    width = 8;
    nfig = width*width;           % number of figures per plot
    n = floor((ncolor+nfig-1)/nfig); % total number of plots
    mod = ncolor - (n-1)*nfig;      % residual
    for i = 1:(n-1)
        figure;
        % 和 subplot 类似
        tiledlayout(width, width, 'TileSpacing', 'compact');
        for j = 1:nfig
            nexttile
            colors = jlColor(cell2mat(k((i-1)*nfig+j)));
            [num_color, ~] = size(colors);
            Y=ones(2,num_color);
            a = area(Y); hold on;
            for ic=1:num_color
                a(ic).FaceColor = colors(num_color-ic+1,:);
            end
            title(cell2mat(k((i-1)*nfig+j)));
            axis off;
            hold off;
        end
    end
    figure;
    tiledlayout(width, width, 'TileSpacing', 'compact');
    for i=1:mod
        nexttile
        colors = jlColor(cell2mat(k(i+(n-1)*nfig)));
        [num_color, ~] = size(colors);
        Y=ones(2,num_color);
        a = area(Y); hold on;
        for ic=1:num_color
            a(ic).FaceColor = colors(num_color-ic+1,:);
        end
        title(cell2mat(k(i+(n-1)*nfig)));
        axis off;
        hold off;
    end
        
else
    figure;
    colors = jlColor(name);
    [num_color, ~] = size(colors);
    Y=ones(2,num_color);
    a = area(Y); hold on;
    for i=1:num_color
        a(i).FaceColor = colors(num_color-i+1,:);
    end
    title(name);
    axis off;
    hold off;
end