function after_picture = RandomCover(picture, total)
    [M, N] = size(picture);
    counter = 0; % 计数器
    while counter < total
        counter = counter + 1;
        % 获取坐标
        x = ceil(M * rand());
        y = ceil(N * rand());
        % 修改原图像为零或一
        flag = rand();
        if flag > 0.5
            picture(x, y) = 0;
        else
            picture(x, y) = 1;
        end
    end
    after_picture = picture;
end