# Customizable MatLab Color Scheme Library

Language : 🇺🇸 | [🇨🇳](./README.md)

## Motivation

Sometimes the default MatLab colors for plottings are not satisfactory and I would like to define and use my own color schemes. When I see a beautiful color scheme, I also would like to save it to my color scheme library. But when I want to use a certain color scheme, it might be difficult to find it in my library. So here I created this project to save, preview and use customized color schemes in MatLab.

## Features

- Preview a certain color scheme, or preview all color schemes
- Get and use a color scheme
- Define and save a color scheme
- Create a color scheme by sampling points on a image/picture

## Prerequisite

- MatLab version $\geq$ 2021a
    
    Optional. Function `tiledlayout()`, which was introduced to MatLab in vewrsion 2021a, is used in `jlShowColor.m`. If your MatLab version is older than 2021a, you need to modify the source code in the `jlShowColor.m` file and change the `tiledlayout()` to some equivalent functions, such as `subplot()`.

- [Image Processing Toolbox](https://www.mathworks.com/products/image.html?s_tid=AO_PR_info)

    Optional. This MatLab toolbox is needed when you want to get colors from a picture to define customized color schemes.

## Install

1. By default, the user-defined scripts, functions and tools are placed in directory `~/Documents/MATLAB`. Here I suggest you should also clone this `jlcolor` library to this directory:
    ```bash
    git clone https://github.com/jin-li/jlcolor.git ~/Documents/MATLAB/jlcolor
    ```
1. Then add the path to MATLAB。 
    ![](https://img.jinli.cyou/images/2023/02/20/matlab_savepath.md.png)
    
    You can do it with commands, too. Open MatLab and run following commands in the MatLab command window: 
    - For Windows users
        ```matlab
        addpath([getenv('USERPROFILE'),'\Documents\MATLAB\jlcolor']);
        savepath;
        ```
    - For Linux or macOS users
        ```matlab
        addpath([getenv('HOME'),'/Documents/MATLAB/jlcolor']);
        savepath;
        ```

## Usage

- **Preview a Color Scheme**
    - Open MatLab and run following command to preview all the color schemes in the library:
        ```matlab
        jlShowColor('all')
        ```
        Then all the color schemes will show up with their names: 
        ![](https://img.jinli.cyou/images/2023/02/20/JLcolor.md.jpg)
    - You can also preview a single color scheme. For example, you can use following command to preview the color scheme named "rainbow":
        ```matlab
        jlShowColor('rainbow')
        ```

- **Get and Use a Color Scheme**
    1. You can get a color scheme in the library with function `jlGetColor()`. For example, using following command
        ```matlab
        c = jlGetColor('rainbow')
        ```
        you can export the seven colors in color scheme "rainbow" to variable `c`. 
    1. Then you can use the seven colors when you make a plot. For example, 
        ```matlab
        c = jlGetColor('rainbow'); % get color scheme
        figure; hold on;
        x=0:0.01:1;
        for i=1:length(c)
            plot(x,sin(2*pi*x-pi*i/12),'color',c(i),'linewidth',5);
        end
        ```
        Here is how the plot looks like: 
        ![](https://img.jinli.cyou/images/2023/02/20/rainbow.md.jpg)


- **Self-define and Save a Color Scheme**
    
    - The color schemes are stored in file `jlColorLib.m`. Users can add color schemes to the file. For example, the default color scheme in MatLab is: 
    ![](https://img.jinli.cyou/images/2023/02/20/matlab_color.md.png)
    One can add the hex code of the seven colors to `jlColorLib.m` by mimicing the existing color schemes in the file. So you can add another line in `jlColorLib.m`:
        ```matlab
        jlColor('matlab') = ['#0072BD';'#D95319';'#EDB120';'#7E2F8E';'#77AC30';'#4DBEEE';'#A2142F'];
        ```
        Then the default MatLab color scheme is saved in the library with a name "matlab".

    - Or you can use function `jlAddColor()` to add a color scheme to the library. For example, you can run following commands in MatLab's command window:
        ```matlab
        colors = ["#0072BD","#D95319","#EDB120","#7E2F8E","#77AC30","#4DBEEE","#A2142F"];
        jlAddColor(colors, "matlab");
        ```

- **Create a Color Scheme by Sampling Points on a Picture**

    You can create you own color scheme conveniently by sampling points on a picture, with the help of function `jlAddColorFromImage()`. For example, the color scheme "rainbow" used above and the color scheme "sunset" in the library are all generated from pictures. Suppose you have the picture file "sunset.jpeg", then you can run following command in MatLab's command window:

    ```matlab
    jlAddColorFromImage('sunset.jpeg','sunset');
    ```

    Then a window like below will pop out. And you can click on it with your mouse for the colors you need: 
    ![](https://img.jinli.cyou/images/2023/02/20/add_color.md.png)
    
    Press `Enter` key when you are done selecting the points. Then another window showing the color scheme being created successfully will pop out! 
    ![](https://img.jinli.cyou/images/2023/02/20/sunset.md.png)

## Acknowledgement

- The function that converts RGB to hex code used in the library is from the Mathworks community user [Chad Greene](https://www.mathworks.com/matlabcentral/profile/authors/1062128)'s [script](https://www.mathworks.com/matlabcentral/fileexchange/46289-rgb2hex-and-hex2rgb).
- Some of the color schemes in this library are from Zhihu user [CoderMan](https://www.zhihu.com/people/1105936347)'s post [【2.1.1 颜色模板】科研绘图必备的60套颜色模板](https://zhuanlan.zhihu.com/p/488125051).