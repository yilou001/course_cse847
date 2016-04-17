load('USPS.mat');
label = L;
x= A;
coeff = pca(x);
coeff_10 = coeff(1:10,:);
coeff_50 = coeff(1:50,:);
coeff_100 = coeff(1:100,:);
coeff_200 = coeff(1:200,:);
x_transform_10 = x* coeff_10' *coeff_10;
x_transform_50 = x* coeff_50' *coeff_50;
x_transform_100 = x* coeff_100' *coeff_100;
x_transform_200 = x* coeff_200' *coeff_200;
reconstruct_error_10 = norm(x - x_transform_10, 'fro');
reconstruct_error_50 = norm(x - x_transform_50, 'fro');
reconstruct_error_100 = norm(x - x_transform_100, 'fro');
reconstruct_error_200 = norm(x - x_transform_200, 'fro');


A1_10 = reshape(x_transform_10(1,:), 16,16);
A2_10 = reshape(x_transform_10(2,:), 16,16);
subplot(4,2,1)
imshow(A1_10');
title('p=10, the first image');
subplot(4,2,2);
imshow(A2_10');
title('p=10, the second image');

A1_50 = reshape(x_transform_50(1,:), 16,16);
A2_50 = reshape(x_transform_50(2,:), 16,16);
subplot(4,2,3);
imshow(A1_50');
title('p=50, the first image');
subplot(4,2,4);
imshow(A2_50');
title('p=50, the second image');

A1_100 = reshape(x_transform_100(1,:), 16,16);
A2_100 = reshape(x_transform_100(2,:), 16,16);
subplot(4,2,5);
imshow(A1_100');
title('p=100, the first image');
subplot(4,2,6);
imshow(A2_100');
title('p=100, the second image');

A1_200 = reshape(x_transform_200(1,:), 16,16);
A2_200 = reshape(x_transform_200(2,:), 16,16);
subplot(4,2,7);
imshow(A1_200');
title('p=200, the first image');
subplot(4,2,8);
imshow(A2_200');
title('p=200, the second image');

