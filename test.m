all_msg = [1 2 3 4 5 6 7];
all_msg_gf = gf(all_msg, 3);

% 现在做域内乘法
c = all_msg_gf(3) * all_msg_gf(4);   % 即 GF(8) 中 3·4
% 结果不是 12，而是按 x^3+x+1 约化后的值（MATLAB 默认用 x^3+x+1）

% 做域内加法
s = all_msg_gf(3) + all_msg_gf(5);   % = 3 XOR 5 = 6

% 读取图片
img = imread('table.png'); 
% 显示图片
imshow(img);