function similarity = ImSimilar(pic1, pic2)
    % 只能用于两张大小相同的图片
    [a, b] = size(pic1);
    % 灰度计数器
    cnt1 = zeros(1, 256);
    cnt2 = zeros(1, 256);
    % 获取直方图分布
    for i = 1:a
        for j = 1:b
            tmp1 = pic1(i,j) + 1;
            tmp2 = pic2(i,j) + 1;
            cnt1(tmp1) = cnt1(tmp1) + 1;
            cnt2(tmp2) = cnt2(tmp2) + 1;
        end
    end
    % 将直方图分为64个区
    gram1 = zeros(1, 64);
    gram2 = zeros(1, 64);
    for i = 0:63
        gram1(1, i+1) = cnt1(4 * i + 1) + cnt1( 4 * i + 2) + cnt1(4 * i + 3) + cnt1(4 * i + 4);
        gram2(1, i+1) = cnt2(4 * i + 1) + cnt2( 4 * i + 2) + cnt2(4 * i + 3) + cnt2(4 * i + 4);
    end
    % 计算余弦相似度
    A = sqrt(sum(sum(gram1.^2)));
    B = sqrt(sum(sum(gram2.^2)));
    C = sum(sum(gram1.*gram2));
    similarity = C / (A * B); % 计算余弦值，越大越相似
end