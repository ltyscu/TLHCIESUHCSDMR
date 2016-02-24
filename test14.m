
rgbimage = imread('../pic/lena.bmp');

r_image = rgbimage(:, :, 1);
g_image = rgbimage(:, :, 2);
b_image = rgbimage(:, :, 3);

%% decompose R of RGB to 8 bitplanes
[r,c]= size(r_image);         % get the dimensions of image
s_r = zeros(r,c,8);           % pre allocate a variable to store 8 bit planes of the image

for k = 1:8
    for i = 1:r
        for j = 1:c
            s_r(i,j,k) = bitget(r_image(i,j),k);    %get kth bit from each pixel
        end
    end
end

%% decompose G of RGB to 8 bitplanes
[r,c]= size(g_image);         % get the dimensions of image
s_g = zeros(r,c,8);           % pre allocate a variable to store 8 bit planes of the image

for k = 1:8
    for i = 1:r
        for j = 1:c
            s_g(i,j,k) = bitget(g_image(i,j),k);    %get kth bit from each pixel
        end
    end
end

%% decompose B of RGB to 8 bitplanes
[r,c]= size(b_image);         % get the dimensions of image
s_b = zeros(r,c,8);           % pre allocate a variable to store 8 bit planes of the image

for k = 1:8
    for i = 1:r
        for j = 1:c
            s_b(i,j,k) = bitget(b_image(i,j),k);    %get kth bit from each pixel
        end
    end
end

%% initialize some variables

R1 = s_r(:, :, 1);
R2 = s_r(:, :, 2);
R3 = s_r(:, :, 3);
R4 = s_r(:, :, 4);
R5 = s_r(:, :, 5);
R6 = s_r(:, :, 6);
R7 = s_r(:, :, 7);
R8 = s_r(:, :, 8);

G1 = s_g(:, :, 1);
G2 = s_g(:, :, 2);
G3 = s_g(:, :, 3);
G4 = s_g(:, :, 4);
G5 = s_g(:, :, 5);
G6 = s_g(:, :, 6);
G7 = s_g(:, :, 7);
G8 = s_g(:, :, 8);

B1 = s_b(:, :, 1);
B2 = s_b(:, :, 2);
B3 = s_b(:, :, 3);
B4 = s_b(:, :, 4);
B5 = s_b(:, :, 5);
B6 = s_b(:, :, 6);
B7 = s_b(:, :, 7);
B8 = s_b(:, :, 8);

for i = 1:512
    for j = 1:512
        if R1(i, j)