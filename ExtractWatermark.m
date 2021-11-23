% alpha 是水印的嵌入强度
function watermark=ExtractWatermark(after_picture, picture, alpha, MW, NW)
    dif = after_picture - picture; % 合成图像和原图像的差值
    counter = 0;
    [MP, NP] = size(picture); % 图片尺寸
    % 将输入图片拆分成 8x8 的块
    Block_P_Row = MP / 8;
    Block_P_Col = NP / 8;
    Block_W = ceil(MW * NW / 11); % 将水印按 11 个像素点分块
    watermark = zeros(11 * Block_W, 1); % 提取的水印初始化
    A = dctmtx(8); % 获取 DCT 变换矩阵
    midmask = [0 0 0 0 1 1 0 0; % 中频掩膜矩阵
               0 0 0 1 1 0 0 0;
               0 0 1 1 0 0 0 0;
               0 1 1 0 0 0 0 0;
               1 1 0 0 0 0 0 0;
               1 0 0 0 0 0 0 0;
               0 0 0 0 0 0 0 0;
               0 0 0 0 0 0 0 0];
    nonzero_midmask = midmask == 1; % 获取非零元素位置
    for i = 0 : Block_P_Row - 1
        for j = 0 : Block_P_Col - 1
            block = dif(8 * i + 1 : 8 * i + 8, 8 * j + 1 : 8 * j + 8); % 提取差图像的块
            after_block = A * block * A'; % 执行 DCT 变换
            coef = midmask .* after_block; % 仅提取中频系数
            if counter < Block_W
                watermark(11 * counter + 1 : 11 * counter + 11) = (1 / alpha) * coef(nonzero_midmask); % 还原水印信息
            end
            counter = counter + 1;
        end
    end
    watermark(MW * NW + 1 : end) = []; % 去除水印末尾补上的 0
    watermark = reshape(watermark, [MW, NW]); % 将列向量转换为矩阵
end