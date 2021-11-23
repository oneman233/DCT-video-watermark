function after_picture = AreaCover(picture, NN, MM)
    [N, M] = size(picture);
    after_picture = picture;
    % 获取坐标
    x = ceil(N * rand());
    y = ceil(M * rand());
    X = x + NN;
    if X > N
        X = N;
    end
    Y = y + MM;
    if Y > M
        Y = M;
    end
    for i = x:X
        for j = y:Y
            after_picture(i,j) = 0;
        end
    end
end