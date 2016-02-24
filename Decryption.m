N = 512; M = 512;

%% SHA-256 hash value

%  hex_value = 'af29991e60d2e1559aefb1e064966779af718a0e786cb44955efc0b894aa88ae'; %airplane 
%  hex_value = '0c6cfb2c756aa6bac0be67fece3801de03081f71bcca0e456acb43435fead0b3'; %baboon
%  hex_value = 'ef6754b751398420d22977afbe731c7fcb032dc49547004d4852ec0aa2134ded'; %lena
%  hex_value = '53d9c421dc1e5be18fa01bb18252fb8997663a1e340780e0cecd045240d6eafc'; %pepper
%  hex_value = '441214b6f76a31234d21013e25f5c35dcc4181ddf71e8651631e64b146875503'; %sailboat
%  hex_value = '5c5f8323e81de3e191c10975369d840f79d0ce19e6c88d86f1b0adcae16ebf3a'; %tiffany

%  hex_value = '8935ce8b294e4052c301b2c443965596293d10e4ec6e5c56550374ad9db69fce'; %black
%  hex_value = '98408c1100653ef127a9c20159b4acf91f9ccbd7c4e0e4f16b0f9a1131e997c4'; %white

%  hex_value = 'c1ee7a4cd68ee4e34a3331a860944c48bece29e0154e852a79c4a14899b3b99b';  %Changed Airplane
%  hex_value = '5498d18337dafe970a0366013af058f5dc4932580b2ddedca4cca1943b81099c';  %Changed Baboon
%  hex_value = '92b7d5555261ce617e17aaa441865963ccd604d39295648573d52dcc01e7e391';  %Changed Lena
%  hex_value = '39ae2e7a364ea560ed1294a2ab44e566969d83ae93e7a5dd7420117c2ca0ce50';  %Changed Pepper
%  hex_value = '339d4e950da54067d29bc071d36aabc4e0a07bc1a62f8202fe72c57cfe8828e7';  %Changed Sailboat
%  hex_value = 'ed7cec3148c2f578e888be1ae102dd5fe258ce8d2fd975778d92d8782c45c636';  %Changed Tiffany
 
%  hex_value = 'b7e730a4dd7e5957d0487c9b106ee71d6852c02333a4d4380efb877e1ec49f29'; %Test

%% generate a 64 binary bits
hex_value_dec = hex2dec(hex_value(1:16));
hex_value_bin = dec2bin(hex_value_dec, 64);

%%
d1 = bin2dec(hex_value_bin(1:8));
d2 = bin2dec(hex_value_bin(9:16));
d3 = bin2dec(hex_value_bin(17:24));
d4 = bin2dec(hex_value_bin(25:32));
d5 = bin2dec(hex_value_bin(33:40));
d6 = bin2dec(hex_value_bin(41:48));
d7 = bin2dec(hex_value_bin(49:56));
d8 = bin2dec(hex_value_bin(57:64));

x1 = mod( bitxor(bitxor(bitxor(bitxor(bitxor( bitxor( bitxor(d1, d2), d3), d4), d5), d6), d7), d8), 256) / 255;

% x1 = x1 + 0.000000000000001;
%%
hex_value_dec = hex2dec(hex_value(17:32));
hex_value_bin = dec2bin(hex_value_dec, 64);

d1 = bin2dec(hex_value_bin(1:8));
d2 = bin2dec(hex_value_bin(9:16));
d3 = bin2dec(hex_value_bin(17:24));
d4 = bin2dec(hex_value_bin(25:32));
d5 = bin2dec(hex_value_bin(33:40));
d6 = bin2dec(hex_value_bin(41:48));
d7 = bin2dec(hex_value_bin(49:56));
d8 = bin2dec(hex_value_bin(57:64));

x2 = mod( bitxor(bitxor(bitxor(bitxor(bitxor( bitxor( bitxor(d1, d2), d3), d4), d5), d6), d7), d8), 256) / 255;

% x2 = x2 + 0.0000000000000001;

%%
hex_value_dec = hex2dec(hex_value(33:48));
hex_value_bin = dec2bin(hex_value_dec, 64);

d1 = bin2dec(hex_value_bin(1:8));
d2 = bin2dec(hex_value_bin(9:16));
d3 = bin2dec(hex_value_bin(17:24));
d4 = bin2dec(hex_value_bin(25:32));
d5 = bin2dec(hex_value_bin(33:40));
d6 = bin2dec(hex_value_bin(41:48));
d7 = bin2dec(hex_value_bin(49:56));
d8 = bin2dec(hex_value_bin(57:64));

x3 = mod( bitxor(bitxor(bitxor(bitxor(bitxor( bitxor( bitxor(d1, d2), d3), d4), d5), d6), d7), d8), 256) / 255;

% x3 = x3 + 0.0000000000000001;
%%
hex_value_dec = hex2dec(hex_value(49:64));
hex_value_bin = dec2bin(hex_value_dec, 64);

d1 = bin2dec(hex_value_bin(1:8));
d2 = bin2dec(hex_value_bin(9:16));
d3 = bin2dec(hex_value_bin(17:24));
d4 = bin2dec(hex_value_bin(25:32));
d5 = bin2dec(hex_value_bin(33:40));
d6 = bin2dec(hex_value_bin(41:48));
d7 = bin2dec(hex_value_bin(49:56));
d8 = bin2dec(hex_value_bin(57:64));

x4 = mod( bitxor(bitxor(bitxor(bitxor(bitxor( bitxor( bitxor(d1, d2), d3), d4), d5), d6), d7), d8), 256) / 255;

% x4 = x4 + 0.0000000000000001;
%% Chen attractor
a = 40.00000000;

b = 3.00000000;

c = 28.00000000;


t = 0.00100000;
x = x1;
y = x2;
z = x3;

for i = 1:100 % iterate several times
    u = a * (y - x);
    v = (c - a) * x - x * z + c * y;
    w = x * y - b * z;
    x = x + u * t - floor(x + u * t);
    y = y + v * t - floor(y + v * t);
    z = z + w * t - floor(z + w * t);
end;

x1_ = x;
x2_ = y;
x3_ = z;
x4_ = (x1_ + x2_ + x3_) / 3;


%% Customized GCML
e_ = 0.5;
x_4 = zeros(128*2, 4);
x_4(1, 1) = x1_;
x_4(1, 2) = x2_;
x_4(1, 3) = x3_;
x_4(1, 4) = x4_;
for i = 2:128*2
    val = (e_/4) * (f1(x_4(i-1, 1)) + f2(x_4(i-1, 2)) + f3(x_4(i-1, 3)) + f4(x_4(i-1, 4)));
    for j = 1:4
        x_4(i, j) = (1 - e_) * dispatch(j, x_4(i-1, j)) + val;
    end;
end;


%% Convert 'x_4' from 256*4 to 1*1024
x_4_ = reshape(x_4, 1, 512*2);
x_4__ = floor(x_4_ * 512) + 1;


%% PRBG
prbg = zeros(1, 1536*2);
x = x1;
y = x2;

for i = 1:1536*2 %512*3
    x = f2(x);
    y = f2(y);
    if x > y
        prbg(i) = 1;
    else
        prbg(i) = 0;
    end;
end;

%% obtain mask image used to generate mask image

% Mask R component
x_r = (x1+x2)/2;
key_image = zeros(1, 512*512);
for i = 1:512*512
    key_image(i) = floor(256*x_r);
    x_r = f1(x_r);
end;
key_image_r = reshape(key_image, 512, 512);

% Mask G component
x_g = (x3+x4)/2;
key_image = zeros(1, 512*512);
for i = 1:512*512
    key_image(i) = floor(256*x_g);
    x_g = f1(x_g);
end;
key_image_g = reshape(key_image, 512, 512);

% Mask B component
x_b = (x1+x2+x3+x4)/4;
key_image = zeros(1, 512*512);
for i = 1:512*512
    key_image(i) = floor(256*x_b);
    x_b = f1(x_b);
end;
key_image_b = reshape(key_image, 512, 512);


%% obtain mask image used to mask bitplanes of R, G and B components
x = x3;
y = x4;
% Mask operations on bitplanes of R component
keyimage_r_bitplanes = zeros(1, 512*512);
for i = 1:512*512
    x = f2(x);
    y = f2(y);
    if x > y
        keyimage_r_bitplanes(i) = 1;
    else
        keyimage_r_bitplanes(i) = 0;
    end;
end;
keyimage_r_bitplanes = reshape(keyimage_r_bitplanes, 512, 512);

% Mask operations on bitplanes of G component
keyimage_g_bitplanes = zeros(1, 512*512);
for i = 1:512*512
    x = f2(x);
    y = f2(y);
    if x > y
        keyimage_g_bitplanes(i) = 1;
    else
        keyimage_g_bitplanes(i) = 0;
    end;
end;
keyimage_g_bitplanes = reshape(keyimage_g_bitplanes, 512, 512);

% Mask operations on bitplanes of G component
keyimage_b_bitplanes = zeros(1, 512*512);
for i = 1:512*512
    x = f2(x);
    y = f2(y);
    if x > y
        keyimage_b_bitplanes(i) = 1;
    else
        keyimage_b_bitplanes(i) = 0;
    end;
end;
keyimage_b_bitplanes = reshape(keyimage_b_bitplanes, 512, 512);


%% read cipher and divide to R, G and B components
rgbimage = imread('../pic/pepper_c.bmp');
rr = rgbimage(:, :, 1);
gg = rgbimage(:, :, 2);
bb = rgbimage(:, :, 3);

% recover to unmask image
rr = bitxor(key_image_r, double(rr));
gg = bitxor(key_image_g, double(gg));
bb = bitxor(key_image_b, double(bb));

%% decompose R, G and B components to corresponding bitplanes

% decompose R of RGB to 8 bitplanes
[r,c]= size(rr);         % get the dimensions of image
s_r = zeros(r,c,8);           % pre allocate a variable to store 8 bit planes of the image

for k = 1:8
    for i = 1:r
        for j = 1:c
            s_r(i,j,k) = bitget(rr(i,j),k);    %get kth bit from each pixel
        end
    end
end

% decompose G of RGB to 8 bitplanes
[r,c]= size(gg);         % get the dimensions of image
s_g = zeros(r,c,8);           % pre allocate a variable to store 8 bit planes of the image

for k = 1:8
    for i = 1:r
        for j = 1:c
            s_g(i,j,k) = bitget(gg(i,j),k);    %get kth bit from each pixel
        end
    end
end

% decompose B of RGB to 8 bitplanes
[r,c]= size(bb);         % get the dimensions of image
s_b = zeros(r,c,8);           % pre allocate a variable to store 8 bit planes of the image

for k = 1:8
    for i = 1:r
        for j = 1:c
            s_b(i,j,k) = bitget(bb(i,j),k);    %get kth bit from each pixel
        end
    end
end

C_R1_M = s_r(:, :, 1);
C_R2_M = s_r(:, :, 2);
C_R3_M = s_r(:, :, 3);
C_R4_M = s_r(:, :, 4);
C_R5_M = s_r(:, :, 5);
C_R6_M = s_r(:, :, 6);
C_R7_M = s_r(:, :, 7);
C_R8_M = s_r(:, :, 8);

C_G1_M = s_g(:, :, 1);
C_G2_M = s_g(:, :, 2);
C_G3_M = s_g(:, :, 3);
C_G4_M = s_g(:, :, 4);
C_G5_M = s_g(:, :, 5);
C_G6_M = s_g(:, :, 6);
C_G7_M = s_g(:, :, 7);
C_G8_M = s_g(:, :, 8);

C_B1_M = s_b(:, :, 1);
C_B2_M = s_b(:, :, 2);
C_B3_M = s_b(:, :, 3);
C_B4_M = s_b(:, :, 4);
C_B5_M = s_b(:, :, 5);
C_B6_M = s_b(:, :, 6);
C_B7_M = s_b(:, :, 7);
C_B8_M = s_b(:, :, 8);

BBBBBBBBBBB8 = C_B8_M;

%% encode and decode 4 higher bitplanes of R, G, B respectively
R1 = zeros(M, N);
R2 = zeros(M, N);
R3 = zeros(M, N);
R4 = zeros(M, N);
R5 = zeros(M, N);
R6 = zeros(M, N);
R7 = zeros(M, N);
R8 = zeros(M, N);

G1 = zeros(M, N);
G2 = zeros(M, N);
G3 = zeros(M, N);
G4 = zeros(M, N);
G5 = zeros(M, N);
G6 = zeros(M, N);
G7 = zeros(M, N);
G8 = zeros(M, N);

B1 = zeros(M, N);
B2 = zeros(M, N);
B3 = zeros(M, N);
B4 = zeros(M, N);
B5 = zeros(M, N);
B6 = zeros(M, N);
B7 = zeros(M, N);
B8 = zeros(M, N);


R1 = before_DNA_operations(prbg, C_R1_M);
R2 = before_DNA_operations(prbg, C_R2_M);
R3 = before_DNA_operations(prbg, C_R3_M);
R4 = before_DNA_operations(prbg, C_R4_M);
R5 = before_DNA_operations(prbg, C_R5_M);
R6 = before_DNA_operations(prbg, C_R6_M);
R7 = before_DNA_operations(prbg, C_R7_M);
R8 = before_DNA_operations(prbg, C_R8_M);

G1 = before_DNA_operations(prbg, C_G1_M);
G2 = before_DNA_operations(prbg, C_G2_M);
G3 = before_DNA_operations(prbg, C_G3_M);
G4 = before_DNA_operations(prbg, C_G4_M);
G5 = before_DNA_operations(prbg, C_G5_M);
G6 = before_DNA_operations(prbg, C_G6_M);
G7 = before_DNA_operations(prbg, C_G7_M);
G8 = before_DNA_operations(prbg, C_G8_M);

B1 = before_DNA_operations(prbg, C_B1_M);
B2 = before_DNA_operations(prbg, C_B2_M);
B3 = before_DNA_operations(prbg, C_B3_M);
B4 = before_DNA_operations(prbg, C_B4_M);
B5 = before_DNA_operations(prbg, C_B5_M);
B6 = before_DNA_operations(prbg, C_B6_M);
B7 = before_DNA_operations(prbg, C_B7_M);
B8 = before_DNA_operations(prbg, C_B8_M);

% convert char to double
R1 = R1 - '0';
R2 = R2 - '0';
R3 = R3 - '0';
R4 = R4 - '0';
R5 = R5 - '0';
R6 = R6 - '0';
R7 = R7 - '0';
R8 = R8 - '0';

G1 = G1 - '0';
G2 = G2 - '0';
G3 = G3 - '0';
G4 = G4 - '0';
G5 = G5 - '0';
G6 = G6 - '0';
G7 = G7 - '0';
G8 = G8 - '0';

B1 = B1 - '0';
B2 = B2 - '0';
B3 = B3 - '0';
B4 = B4 - '0';
B5 = B5 - '0';
B6 = B6 - '0';
B7 = B7 - '0';
B8 = B8 - '0';

%% TEST "before encode_and_decode, after permutation"
%test 
RR8 = R8;
RR7 = R7;

%test
GG8 = G8;
GG7 = G7;

%test
BB8 = B8;
BB7 = B7;

%% recover to unmask image
R1 = bitxor(keyimage_r_bitplanes, R1);
R2 = bitxor(keyimage_r_bitplanes, R2);
R3 = bitxor(keyimage_r_bitplanes, R3);
R4 = bitxor(keyimage_r_bitplanes, R4);
R5 = bitxor(keyimage_r_bitplanes, R5);
R6 = bitxor(keyimage_r_bitplanes, R6);
R7 = bitxor(keyimage_r_bitplanes, R7);
R8 = bitxor(keyimage_r_bitplanes, R8);

G1 = bitxor(keyimage_g_bitplanes, G1);
G2 = bitxor(keyimage_g_bitplanes, G2);
G3 = bitxor(keyimage_g_bitplanes, G3);
G4 = bitxor(keyimage_g_bitplanes, G4);
G5 = bitxor(keyimage_g_bitplanes, G5);
G6 = bitxor(keyimage_g_bitplanes, G6);
G7 = bitxor(keyimage_g_bitplanes, G7);
G8 = bitxor(keyimage_g_bitplanes, G8);

B1 = bitxor(keyimage_b_bitplanes, B1);
B2 = bitxor(keyimage_b_bitplanes, B2);
B3 = bitxor(keyimage_b_bitplanes, B3);
B4 = bitxor(keyimage_b_bitplanes, B4);
B5 = bitxor(keyimage_b_bitplanes, B5);
B6 = bitxor(keyimage_b_bitplanes, B6);
B7 = bitxor(keyimage_b_bitplanes, B7);
B8 = bitxor(keyimage_b_bitplanes, B8);

r_image = R1 + R2*2 + R3*4 + R4*8 + R5*16 + R6*32 + R7*64 + R8*128;
g_image = G1 + G2*2 + G3*4 + G4*8 + G5*16 + G6*32 + G7*64 + G8*128;
b_image = B1 + B2*2 + B3*4 + B4*8 + B5*16 + B6*32 + B7*64 + B8*128;

%% Permutate to R, G and B components of Cipher image
%% TODO:
R = r_image;
for i = 512-1:-1:1
    temp = R(:, x_4__(i+1));
    R(:, x_4__(i+1)) = R(:, i);
    R(:, i) = temp;
    
    temp = R(x_4__(i), :);
    R(x_4__(i), :) = R(i, :);
    R(i, :) = temp;
end;

G = g_image;
for i = 512-1:-1:1
    temp = G(:, x_4__(i+1));
    G(:, x_4__(i+1)) = G(:, i);
    G(:, i) = temp;
    
    temp = G(x_4__(i), :);
    G(x_4__(i), :) = G(i, :);
    G(i, :) = temp;
end;

B = b_image;
for i = 512-1:-1:1
    temp = B(:, x_4__(i+1));
    B(:, x_4__(i+1)) = B(:, i);
    B(:, i) = temp;
    
    temp = B(x_4__(i), :);
    B(x_4__(i), :) = B(i, :);
    B(i, :) = temp;
end;

rgbimage = cat(3, R, G, B);
imshow(uint8(rgbimage));
imwrite(uint8(rgbimage), '../pic/pepper_d_.bmp', 'bmp');