% 视频处理函数
function VideoProcess(alpha, videopath, watermarkpath, TOTAL)
    video = VideoReader(videopath);
    watermark = ReadWatermark(watermarkpath);
    
    fprintf('Total frames: %d\n', video.NumFrames);
    
    % 用于写入视频
%     writer = VideoWriter('watermarked_video.avi', 'MPEG-4');
%     writer = VideoWriter('watermarked_video_noise.avi', 'MPEG-4');
%     writer = VideoWriter('watermarked_extract.avi', 'MPEG-4');
%     writer = VideoWriter('watermarked_video_noise_2.avi', 'MPEG-4');
%     writer = VideoWriter('watermarked_extract_2.avi', 'MPEG-4');
%     writer = VideoWriter('watermarked_video_noise_3.avi', 'MPEG-4');
%     writer = VideoWriter('watermarked_extract_3.avi', 'MPEG-4');
%     writer = VideoWriter('watermarked_video_noise_4.avi', 'MPEG-4');
%     writer = VideoWriter('watermarked_extract_4.avi', 'MPEG-4');
%     writer = VideoWriter('watermarked_video_noise_5.avi', 'MPEG-4');
%     writer = VideoWriter('watermarked_extract_5_2.avi', 'MPEG-4');
%     writer = VideoWriter('watermarked_video_noise_6.avi', 'MPEG-4');
    writer = VideoWriter('watermarked_extract_6.avi', 'MPEG-4');
    % 调整帧率  
    writer.FrameRate = video.FrameRate;
    
    open(writer);
    counter = 0;
    
    % 逐帧处理视频
    while hasFrame(video)
        fprintf("Frame: %d\n", counter);
        counter = counter + 1;
        % 控制处理的视频总帧数
        if counter > TOTAL
            break;
        end
        frame = readFrame(video);
        frame = im2double(frame); % 转换为实数值
        origin = frame; % 保留原图片
        frame = AddWatermark(frame, watermark, alpha);
%         frame = AddGaussianNoise(frame, 0.05); % 添加高斯噪声
%         frame = RandomCover(frame, 100000); % 随机覆盖
%         frame = AreaCover(frame, 200, 100); % 区域覆盖
        frame = Gray2Rgb(frame); % 转换为 RGB 图像
%         frame = CutPicture(frame); % 图片裁剪
%         frame = RotatePicture(frame); % 图片旋转
        frame = MaxPool(frame);
%         frame = Gray2Rgb(frame); % 转换为 RGB 图像
        
        % 提取水印
        [MW, NW] = size(watermark); % 获取水印图像大小
        frame = ExtractWatermark(frame, origin, alpha, MW, NW);
        frame = Gray2Rgb(frame); % 转换为 RGB 图像
        
        frame = im2uint8(frame); % double 图像转换为 uint8
%         imshow(frame);
        writeVideo(writer, frame);
    end
    close(writer);
end