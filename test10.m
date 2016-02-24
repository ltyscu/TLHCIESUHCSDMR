p = imread('../pic/comp/tiffany_c.bmp');
pp = imread('../pic/comp/tiffany_changed_c.bmp');

p_1 = p(:, :, 1);
p_2 = p(:, :, 2);
p_3 = p(:, :, 3);

pp_1 = pp(:, :, 1);
pp_2 = pp(:, :, 2);
pp_3 = pp(:, :, 3);

NPCRandUACI(p_1, pp_1)
NPCRandUACI(p_2, pp_2)
NPCRandUACI(p_3, pp_3)