function after_picture = RandomCover(picture, total)
    [M, N] = size(picture);
    counter = 0; % 计数器
    while counter < total
        counter = counter + 1;
        % 获取坐标
        x = ceil(M * rand());
        y = ceil(N * rand());
        picture(x,y) = 0; % 修改原图像
    end
    after_picture = picture;
end