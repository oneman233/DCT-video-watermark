% alpha 是水印的嵌入强度
function after_picture = AddWatermark(picture, watermark, alpha)
    lowmask = [1 1 1 1 0 0 0 0; % 低频掩膜矩阵
               1 1 1 0 0 0 0 0;
               1 1 0 0 0 0 0 0;
               1 0 0 0 0 0 0 0;
               0 0 0 0 0 0 0 0;
               0 0 0 0 0 0 0 0;
               0 0 0 0 0 0 0 0;
               0 0 0 0 0 0 0 0];
    midmask = [0 0 0 0 1 1 0 0; % 中频掩膜矩阵
               0 0 0 1 1 0 0 0;
               0 0 1 1 0 0 0 0;
               0 1 1 0 0 0 0 0;
               1 1 0 0 0 0 0 0;
               1 0 0 0 0 0 0 0;
               0 0 0 0 0 0 0 0;
               0 0 0 0 0 0 0 0];
    nonzero_midmask = find(midmask == 1); % 获取非零元素位置
    [MP, NP] = size(picture); % 图片尺寸
    [MW, NW] = size(watermark); % 水印尺寸
    % 将输入图片拆分成 8x8 的块
    Block_P_Row = MP / 8;
    Block_P_Col = NP / 8;
    Block_W = ceil(MW * NW / 11); % 将水印按 11 个像素点分块
    watermark = watermark(:); % 水印向量化
    watermark(MW * NW + 1 : 11 * Block_W) = 0; % 水印补 0
    A = dctmtx(8); % 获取 DCT 变换矩阵
    after_picture = zeros(MP, NP); % 初始化嵌入水印后的图像
    counter = 0;
    for i = 0 : Block_P_Row - 1
        for j = 0 : Block_P_Col - 1
            block = picture(8 * i + 1 : 8 * i + 8, 8 * j + 1 : 8 * j + 8); % 提取原图像的块
            after_block = A * block * A'; % 执行 DCT 变换
            coef = (lowmask + midmask) .* after_block; % 提取中低频系数
            if (counter < Block_W)
                coef(nonzero_midmask) = ...
                    coef(nonzero_midmask) + alpha * watermark(11 * counter + 1 : 11 * counter + 11);
            end
            after_picture(8 * i + 1 : 8 * i + 8, 8 * j + 1 : 8 * j + 8) = A' * coef * A; % 执行 DCT 逆变换
            counter = counter + 1;
        end
    end
end