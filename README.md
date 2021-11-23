# 基于 DCT 的视频水印嵌入

东南大学《网络信息安全与信息隐藏》课程实验

## 目录结构

文件名|函数|功能
---|---|---
AddNoise.m|`after_picture = AddNoise(picture, std)`|向指定图片中添加标准差为 `std` 的高斯噪声
RandomCover.m|`after_picture = RandomCover(picture, total)`|随机选取 `total` 个图片像素点置为零
AreaCover.m|`after_picture = AreaCover(picture, NN, MM)`|随机选取长为 `NN`，宽为 `MM` 的图片区域置为零
ReadWatermark.m|`watermark = ReadWatermark(filepath)`|从文件路径 `filepath` 中读取并返回水印图片
AddWatermark.m|`after_picture = AddWatermark(picture, watermark, alpha)`|向指定图片中嵌入水印并返回嵌入后图片，嵌入强度为 `alpha`
ExtractWatermark.m|`watermark=ExtractWatermark(after_picture, picture, alpha, MW, NW)`|从指定图片中提取水印，要求给出水印的长 `MW`、水印的宽 `MW` 以及嵌入强度 `alpha`
Gray2Rgb.m|`rgb=Gray2Rgb(gray)`|将灰度图片的三个通道组合为 RGB 图片
VideoPrcess.m|`VideoProcess(alpha, videopath, watermarkpath)`|向视频添加水印，每一帧中都进行添加
main.m|\\|主函数

## 三种攻击方式

* 高斯噪声
* 随机选取图片像素点置为零
* 随机选取图片区域置为零

## 下一步改进

* 不一定每一帧中都添加
* 直接以图片处理太暴力
  * 未压缩域水印算法
  * 压缩过程水印算法
* 音频域水印
