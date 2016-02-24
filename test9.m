airplane = imread('../pic/tiffany_c.bmp');
airplane_1 = airplane(:, :, 1);
airplane_2 = airplane(:, :, 2);
airplane_3 = airplane(:, :, 3);

correlatecalculate(airplane_1)
correlatecalculate(airplane_2)
correlatecalculate(airplane_3)