function [changed_image] = change_one_bit(p)


hpos = ceil(unifrnd(0, 1, 1) * 512);
vpos = ceil(unifrnd(0, 1, 1) * 512);

p_1 = p(:, :, 1);
p_2 = p(:, :, 2);
p_3 = p(:, :, 3);

if p(hpos, vpos) ~= 255
    p_1(hpos, vpos) = p_1(hpos, vpos) + 1;
    p_2(hpos, vpos) = p_2(hpos, vpos) + 1;
    p_3(hpos, vpos) = p_3(hpos, vpos) + 1;
else
    p_1(hpos, vpos) = p_1(hpos, vpos) + 1;
    p_2(hpos, vpos) = p_2(hpos, vpos) + 1;
    p_3(hpos, vpos) = p_3(hpos, vpos) + 1;
end;

p = cat(3, p_1, p_2, p_3);

changed_image = uint8(p);