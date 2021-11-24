function img = ReArnold(arnold_img, a, b, n)
    [h, w] = size(arnold_img);
    img = zeros(h, w);
    N = h;
    for i = 1:n
        for y = 1:h
            for x = 1:w           
                xx = mod((a * b + 1) * (x - 1) - b * (y - 1), N) + 1;
                yy = mod(-a * (x - 1) + (y - 1), N) + 1;
                img(yy,xx) = arnold_img(y, x);
            end
        end
        arnold_img = img;
    end
    img = uint8(img);
end