# 基于 DCT 的视频水印嵌入

东南大学《网络信息安全与信息隐藏》课程实验

## 目录结构

文件名|函数|功能
---|---|---
AddGaussianNoise.m|`after_picture = AddGaussianNoise(picture, std)`|向指定图片中添加标准差为 `std` 的高斯噪声
RandomCover.m|`after_picture = RandomCover(picture, total)`|随机选取 `total` 个图片像素点置为零或一（椒盐噪声）
AreaCover.m|`after_picture = AreaCover(picture, NN, MM)`|随机选取图片中长为 `NN`，宽为 `MM` 的某个颜色通道置为零
CutPicture.m|`after_picture = CutPicture(pic)`|裁剪随机大小的图片区域
RotatePicture.m|`after_picture = RotatePicture(pic)`|将图片逆时针旋转 5° 并裁剪到原来的大小
MaxPool.m|`after_picture = MaxPool(img)`|采用 $3X3$ 矩阵对原图片进行最大值池化压缩，多余的行列被废弃
ReadWatermark.m|`watermark = ReadWatermark(filepath)`|从文件路径 `filepath` 中读取并返回水印图片
AddWatermark.m|`after_picture = AddWatermark(picture, watermark, alpha)`|向指定图片中嵌入水印并返回嵌入后图片，嵌入强度为 `alpha`
ExtractWatermark.m|`watermark=ExtractWatermark(after_picture, picture, alpha, MW, NW)`|从指定图片中提取水印，要求给出水印的长 `MW`、水印的宽 `MW` 以及嵌入强度 `alpha`
Gray2Rgb.m|`rgb=Gray2Rgb(gray)`|将灰度图片的三个通道组合为 RGB 图片
VideoPrcess.m|`VideoProcess(alpha, videopath, watermarkpath)`|向视频添加水印，每一帧中都进行添加
ImSimilar.m|`similarity = ImSimilar(pic1, pic2)`|计算两张大小相同的图片的直方图余弦相似度，用于提取水印
Arnold.m|`arnold_img = Arnold(img, a, b, n)`|Arnold 置乱，`n` 为置乱次数
ReArnold.m|`img = ReArnold(arnold_img, a, b, n)`|逆 Arnold 置乱，`n` 为置乱次数
main.m|-|主函数

## 攻击方式

* 高斯噪声
* 椒盐噪声
* 某个颜色通道置零
* 图片裁剪
* 图片旋转
* 最大池图片压缩

## 主要优势

* 多颜色通道水印嵌入，不会丢失颜色信息，可以用于提取彩色水印
* 采用 Arnold 置乱水印，充分保护水印信息
