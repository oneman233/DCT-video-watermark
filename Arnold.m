function arnold_img = Arnold(img, a, b, n)
    [h, w] = size(img);
    N = h;
    arnold_img = zeros(h, w);
    for i = 1:n
        for y = 1:h
            for x = 1:w
                xx = mod(x - 1 + b * (y - 1), N) + 1;
                yy = mod(a * (x - 1) + (a * b + 1) * (y - 1), N) + 1;
                arnold_img(yy, xx) = img(y, x);
            end
        end
        img = arnold_img;
    end
    arnold_img = uint8(arnold_img);
end