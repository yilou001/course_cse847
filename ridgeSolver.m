function [MSE_train, MSE_test] = ridgeSolver (x_train, y_train, x_test, y_test,lamda)
%input: training set, test set
%output: matrix of MSE_train and MSE_test for individual lamda
%y_train = matrix_center_scale(y_train);
%y_test = matrix_center_scale(y_test);
W = ridgeReg(x_train, y_train, lamda);
y_hat_train = x_train*W;
[N,p] = size(x_train);
MSE_train = 1/N *(y_train-y_hat_train)'*(y_train-y_hat_train);
y_hat_test = x_test*W;
[N,p] = size(x_test);
MSE_test= 1/N *(y_test-y_hat_test)'*(y_test-y_hat_test);

end




