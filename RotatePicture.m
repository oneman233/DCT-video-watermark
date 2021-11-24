function after_picture = RotatePicture(pic)
    after_picture = imrotate(pic, 5, 'crop');
end