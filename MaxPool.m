function after_picture = MaxPool(img)
    [N, M] = size(img);
    % 预处理图片为 3X3 块
    img_size = size(img);
    while 1
        if mod(img_size(1), 3) == 0
            break;
        end
        img = img(1:end-1, :, :);
        img_size = size(img);
    end
    while 1
        if mod(img_size(2), 3) == 0
            break;
        end
        img = img(:, 1:end-1, :);
        img_size = size(img);
    end
    % 取出颜色块
    im1=img(1:3:end, 1:3:end, :);
    im2=img(2:3:end, 1:3:end, :);
    im3=img(3:3:end, 1:3:end, :);
    im4=img(1:3:end, 2:3:end, :);
    im5=img(2:3:end, 2:3:end, :);
    im6=img(3:3:end, 2:3:end, :);
    im7=img(1:3:end, 3:3:end, :);
    im8=img(2:3:end, 3:3:end, :);
    im9=img(3:3:end, 3:3:end, :);
    % 获取压缩后图像值
    im_max = max(cat(4, im1, im2, im3, im4, im5, im6, im7, im8, im9), [], 4);
    after_picture = imresize(im_max, [N M / 3], 'bicubic'); % 改变为原来图片大小
end