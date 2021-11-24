function after_picture = CutPicture(pic)
    [a, b] = size(pic);
    % 三通道的 RGB 图片
    b = b / 3;
    x = ceil(rand() * a);
    y = ceil(rand() * b);
    for i = x:a
        for j = y:b
            pic(i,j,1) = 0;
            pic(i,j,2) = 0;
            pic(i,j,3) = 0;
        end
    end
    after_picture = pic;
end