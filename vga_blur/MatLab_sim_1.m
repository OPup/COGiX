k = [1 1 0 1 1; 1 1 0 1 1; 0 0 0 0 0; 1 1 0 1 1; 1 1 0 1 1 ];
l = repmat(k, 50, 50);
fm = ones(3)/9; Y = filter2 (fm, l);
imshow(l), figure, imshow(Y)
