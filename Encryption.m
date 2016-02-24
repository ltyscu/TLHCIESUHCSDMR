
N = 512; M = 512;

%% SHA-256 hash value

%  hex_value = 'af29991e60d2e1559aefb1e064966779af718a0e786cb44955efc0b894aa88ae'; %airplane 
%  hex_value = '0c6cfb2c756aa6bac0be67fece3801de03081f71bcca0e456acb43435fead0b3'; %baboon
  hex_value = 'ef6754b751398420d22977afbe731c7fcb032dc49547004d4852ec0aa2134ded'; %lena
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

%% Bitplanes decomposing

rgbimage = imread('../pic/lena.bmp');
r_image = rgbimage(:, :, 1);
g_image = rgbimage(:, :, 2);
b_image = rgbimage(:, :, 3);

%% Preprocessing of Permutation
R = r_image;
for i = 1:512-1
    temp = R(i, :);
    R(i, :) = R(x_4__(i), :);
    R(x_4__(i), :) = temp;
    
    temp = R(:, i);
    R(:, i) = R(:, x_4__(i+1));
    R(:, x_4__(i+1)) = temp;
end;
r_image = R; % R used to debug


G = g_image;
for i = 1:512-1
    temp = G(i, :);
    G(i, :) = G(x_4__(i), :);
    G(x_4__(i), :) = temp;
    
    temp = G(:, i);
    G(:, i) = G(:, x_4__(i+1));
    G(:, x_4__(i+1)) = temp;
end;
g_image = G;


B = b_image;
for i = 1:512-1
    temp = B(i, :);
    B(i, :) = B(x_4__(i), :);
    B(x_4__(i), :) = temp;
    
    temp = B(:, i);
    B(:, i) = B(:, x_4__(i+1));
    B(:, x_4__(i+1)) = temp;
end;
b_image = B;

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


C_R1_M = zeros(M, N);
C_R2_M = zeros(M, N);
C_R3_M = zeros(M, N);
C_R4_M = zeros(M, N);
C_R5_M = zeros(M, N);
C_R6_M = zeros(M, N);
C_R7_M = zeros(M, N);
C_R8_M = zeros(M, N);

C_G1_M = zeros(M, N);
C_G2_M = zeros(M, N);
C_G3_M = zeros(M, N);
C_G4_M = zeros(M, N);
C_G5_M = zeros(M, N);
C_G6_M = zeros(M, N);
C_G7_M = zeros(M, N);
C_G8_M = zeros(M, N);

C_B1_M = zeros(M, N);
C_B2_M = zeros(M, N);
C_B3_M = zeros(M, N);
C_B4_M = zeros(M, N);
C_B5_M = zeros(M, N);
C_B6_M = zeros(M, N);
C_B7_M = zeros(M, N);
C_B8_M = zeros(M, N);

%% MASK operations

keyimage = zeros(1, 512*512);
x = x3;
y = x4;

% Mask operations on bitplanes of R component
for i = 1:512*512
    x = f2(x);
    y = f2(y);
    if x > y
        keyimage(i) = 1;
    else
        keyimage(i) = 0;
    end;
end;

keyimage = reshape(keyimage, 512, 512);

R1 = bitxor(keyimage, R1);
R2 = bitxor(keyimage, R2);
R3 = bitxor(keyimage, R3);
R4 = bitxor(keyimage, R4);
R5 = bitxor(keyimage, R5);
R6 = bitxor(keyimage, R6);
R7 = bitxor(keyimage, R7);
R8 = bitxor(keyimage, R8);


% Mask operations on bitplanes of G component
for i = 1:512*512
    x = f2(x);
    y = f2(y);
    if x > y
        keyimage(i) = 1;
    else
        keyimage(i) = 0;
    end;
end;

keyimage = reshape(keyimage, 512, 512);

G1 = bitxor(keyimage, G1);
G2 = bitxor(keyimage, G2);
G3 = bitxor(keyimage, G3);
G4 = bitxor(keyimage, G4);
G5 = bitxor(keyimage, G5);
G6 = bitxor(keyimage, G6);
G7 = bitxor(keyimage, G7);
G8 = bitxor(keyimage, G8);


% Mask operations on bitplanes of B component
for i = 1:512*512
    x = f2(x);
    y = f2(y);
    if x > y
        keyimage(i) = 1;
    else
        keyimage(i) = 0;
    end;
end;

keyimage = reshape(keyimage, 512, 512);
B1 = bitxor(keyimage, B1);
B2 = bitxor(keyimage, B2);
B3 = bitxor(keyimage, B3);
B4 = bitxor(keyimage, B4);
B5 = bitxor(keyimage, B5);
B6 = bitxor(keyimage, B6);
B7 = bitxor(keyimage, B7);
B8 = bitxor(keyimage, B8);


RRR7 = R7;
RRR8 = R8;

GGG7 = G7;
GGG8 = G8;

BBB7 = B7;
BBB8 = B8;

%% encode and decode operations

C_R1_M = encode_and_decode(prbg, R1);
C_R2_M = encode_and_decode(prbg, R2);
C_R3_M = encode_and_decode(prbg, R3);
C_R4_M = encode_and_decode(prbg, R4);
C_R5_M = encode_and_decode(prbg, R5);
C_R6_M = encode_and_decode(prbg, R6);
C_R7_M = encode_and_decode(prbg, R7);
C_R8_M = encode_and_decode(prbg, R8);

C_G1_M = encode_and_decode(prbg, G1);
C_G2_M = encode_and_decode(prbg, G2);
C_G3_M = encode_and_decode(prbg, G3);
C_G4_M = encode_and_decode(prbg, G4);
C_G5_M = encode_and_decode(prbg, G5);
C_G6_M = encode_and_decode(prbg, G6);
C_G7_M = encode_and_decode(prbg, G7);
C_G8_M = encode_and_decode(prbg, G8);

C_B1_M = encode_and_decode(prbg, B1);
C_B2_M = encode_and_decode(prbg, B2);
C_B3_M = encode_and_decode(prbg, B3);
C_B4_M = encode_and_decode(prbg, B4);
C_B5_M = encode_and_decode(prbg, B5);
C_B6_M = encode_and_decode(prbg, B6);
C_B7_M = encode_and_decode(prbg, B7);
C_B8_M = encode_and_decode(prbg, B8);



%% Convert char to decimal
C_R1_M = C_R1_M - '0';
C_R2_M = C_R2_M - '0';
C_R3_M = C_R3_M - '0';
C_R4_M = C_R4_M - '0';
C_R5_M = C_R5_M - '0';
C_R6_M = C_R6_M - '0';
C_R7_M = C_R7_M - '0';
C_R8_M = C_R8_M - '0';

C_G1_M = C_G1_M - '0';
C_G2_M = C_G2_M - '0';
C_G3_M = C_G3_M - '0';
C_G4_M = C_G4_M - '0';
C_G5_M = C_G5_M - '0';
C_G6_M = C_G6_M - '0';
C_G7_M = C_G7_M - '0';
C_G8_M = C_G8_M - '0';

C_B1_M = C_B1_M - '0';
C_B2_M = C_B2_M - '0';
C_B3_M = C_B3_M - '0';
C_B4_M = C_B4_M - '0';
C_B5_M = C_B5_M - '0';
C_B6_M = C_B6_M - '0';
C_B7_M = C_B7_M - '0';
C_B8_M = C_B8_M - '0';

%test
str_R8_ = C_R8_M;
str_R7_ = C_R7_M;

%test
str_G8_ = C_G8_M;
str_G7_ = C_G7_M;

%test
str_B8_ = C_B8_M;
str_B7_ = C_B7_M;



%% Combine R, G, B components to RGB image.

rec_r = C_R1_M + C_R2_M*2 + C_R3_M*4 + C_R4_M*8 + C_R5_M*16 + C_R6_M*32 + C_R7_M*64 + C_R8_M*128;
rec_g = C_G1_M + C_G2_M*2 + C_G3_M*4 + C_G4_M*8 + C_G5_M*16 + C_G6_M*32 + C_G7_M*64 + C_G8_M*128;
rec_b = C_B1_M + C_B2_M*2 + C_B3_M*4 + C_B4_M*8 + C_B5_M*16 + C_B6_M*32 + C_B7_M*64 + C_B8_M*128;

%test
RRR = rec_r;
GGG = rec_g;
BBB = rec_b;

%% Generate component key image and Mask R component
x = (x1+x2)/2;
key_image = zeros(1, 512*512);
for i = 1:512*512
    key_image(i) = floor(256*x);
    x = f1(x);
end;
key_image = reshape(key_image, 512, 512);

rec_r = bitxor(key_image, rec_r);

%% Generate component key image and Mask G component
x = (x3+x4)/2;
key_image = zeros(1, 512*512);
for i = 1:512*512
    key_image(i) = floor(256*x);
    x = f1(x);
end;
key_image = reshape(key_image, 512, 512);

rec_g = bitxor(key_image, rec_g);

%% Generate component key image and Mask B component
x = (x1+x2+x3+x4)/4;
key_image = zeros(1, 512*512);
for i = 1:512*512
    key_image(i) = floor(256*x);
    x = f1(x);
end;
key_image = reshape(key_image, 512, 512);

rec_b = bitxor(key_image, rec_b);

%% Combine into one image to get cipher image

rgbimage = cat(3, rec_r, rec_g, rec_b);
imshow(uint8(rgbimage));
% imwrite(uint8(rgbimage), '../pic/lena_c.bmp', 'bmp');
