% std 是噪声强度
function after_picture = AddNoise(picture, std)
    after_picture = imnoise(picture, 'gaussian', std);
end