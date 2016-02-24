function [black, white] = generate_all_black_and_all_white()

M = 512;
N = 512;

black = zeros(M, N);
white = zeros(M, N);

for i = 1:M*N
    black(i) = 0;
end;
black = uint8(black);
imwrite(black, '../pic/black.bmp', 'bmp');

for i = 1:M*N
    white(i) = 255;
end;
white = uint8(white);
imwrite(white, '../pic/white.bmp', 'bmp');