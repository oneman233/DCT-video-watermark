% 返回水印图片
function watermark = ReadWatermark(filepath)
    watermark = imread(filepath);
    watermark = im2double(watermark); % 转换为实数值
end