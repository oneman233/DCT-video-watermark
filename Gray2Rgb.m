function rgb=Gray2Rgb(gray)
    [m, n] = size(gray);
    tmp = mat2cell(gray, m, [n/3 n/3 n/3]);
    [a, b, c] = deal(tmp{:});
    rgb = cat(3, a, b, c);
end