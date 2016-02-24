%% PRBG
keyimage = zeros(1, 512*512);
x = 0.25436223;
y = 0.65783450;

%% Mask operations on bitplanes of R component
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

C_R1_M_ = bitxor(keyimage, C_R1_M);
C_R2_M_ = bitxor(keyimage, C_R2_M);
C_R3_M_ = bitxor(keyimage, C_R3_M);
C_R4_M_ = bitxor(keyimage, C_R4_M);
C_R5_M_ = bitxor(keyimage, C_R5_M);
C_R6_M_ = bitxor(keyimage, C_R6_M);
C_R7_M_ = bitxor(keyimage, C_R7_M);
C_R8_M_ = bitxor(keyimage, C_R8_M);


%% Mask operations on bitplanes of G component
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

C_G1_M_ = bitxor(keyimage, C_G1_M);
C_G2_M_ = bitxor(keyimage, C_G2_M);
C_G3_M_ = bitxor(keyimage, C_G3_M);
C_G4_M_ = bitxor(keyimage, C_G4_M);
C_G5_M_ = bitxor(keyimage, C_G5_M);
C_G6_M_ = bitxor(keyimage, C_G6_M);
C_G7_M_ = bitxor(keyimage, C_G7_M);
C_G8_M_ = bitxor(keyimage, C_G8_M);


%% Mask operations on bitplanes of B component
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

C_B1_M_ = bitxor(keyimage, C_B1_M);
C_B2_M_ = bitxor(keyimage, C_B2_M);
C_B3_M_ = bitxor(keyimage, C_B3_M);
C_B4_M_ = bitxor(keyimage, C_B4_M);
C_B5_M_ = bitxor(keyimage, C_B5_M);
C_B6_M_ = bitxor(keyimage, C_B6_M);
C_B7_M_ = bitxor(keyimage, C_B7_M);
C_B8_M_ = bitxor(keyimage, C_B8_M);


%% Combine 8 bitplanes to R, G or B component
rec_r = C_R1_M_ + C_R2_M_*2 + C_R3_M_*4 + C_R4_M_*8 + C_R5_M_*16 + C_R6_M_*32 + C_R7_M_*64 + C_R8_M_*128;
rec_g = C_G1_M_ + C_G2_M_*2 + C_G3_M_*4 + C_G4_M_*8 + C_G5_M_*16 + C_G6_M_*32 + C_G7_M_*64 + C_G8_M_*128;
rec_b = C_B1_M_ + C_B2_M_*2 + C_B3_M_*4 + C_B4_M_*8 + C_B5_M_*16 + C_B6_M_*32 + C_B7_M_*64 + C_B8_M_*128;

%% Generate component key image and Mask R component
x = 0.7963456;
key_image = zeros(1, 512*512);
for i = 1:512*512
    key_image(i) = floor(256*x);
    x = f1(x);
end;
key_image = reshape(key_image, 512, 512);

rec_r = bitxor(key_image, rec_r);

%% Generate component key image and Mask G component
x = 0.56456;
key_image = zeros(1, 512*512);
for i = 1:512*512
    key_image(i) = floor(256*x);
    x = f1(x);
end;
key_image = reshape(key_image, 512, 512);

rec_g = bitxor(key_image, rec_g);

%% Generate component key image and Mask B component
x = 0.25656;
key_image = zeros(1, 512*512);
for i = 1:512*512
    key_image(i) = floor(256*x);
    x = f1(x);
end;
key_image = reshape(key_image, 512, 512);


rec_b = bitxor(key_image, rec_b);

%% Combine into one image
rgbimage = cat(3, rec_r, rec_g, rec_b);
imshow(uint8(rgbimage));