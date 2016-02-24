blackimage = imread('../pic/white.bmp');

rgbimage = cat(3, blackimage, blackimage, blackimage);

imshow(uint8(rgbimage));

imwrite(uint8(rgbimage), '../pic/white.bmp', 'bmp');