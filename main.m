clc,clear,close all; % 清空命令行和工作区，关闭所有窗口

% 文件目录
VIDEO_PATH = 'never_gonna_give_you_up.mp4';
TEST_PATH = 'lena.png';
WATERMARK_PATH = 'seu_logo.jpg';

VideoProcess(1, VIDEO_PATH, WATERMARK_PATH);

% a = ReadWatermark(TEST_PATH);
% b = ReadWatermark(WATERMARK_PATH);

% subplot(2,2,1)
% imshow(a);
% title('原图像');
% 
% subplot(2,2,2)
% imshow(b);
% title('水印图像');

% ALPHA = 0.01;
% ALPHA = 0.5;
% ALPHA = 10;
% 
% c = AddWatermark(a, b, ALPHA);
% c = Gray2Rgb(c);
% c = AddNoise(c, 0.05);
% subplot(2,2,3);
% imshow(c);
% title('嵌入水印并添加噪声后图像');
% 
% [MW, NW] = size(b); % 获取水印图像大小
% d = ExtractWatermark(c, a, ALPHA, MW, NW);
% d = Gray2Rgb(d);
% subplot(2,2,4);
% imshow(d);
% title('提取出的水印图像');