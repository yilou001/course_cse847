function [ CV ] = cross_valid( x_train, y_train, Kfold,lamda)
% input: training set
%output: cross-validation estimate of prediction error 
%lamda = [1*10^(-5) 1*10^(-4) 1*10^(-3) 1*10^(-2) 1*10^(-1) 1 10];

L=length(lamda);
[num_observe, p] = size(x_train); 
indices = crossvalind('kfold',num_observe, Kfold);
CV=zeros(L,2);
for i = 1: L
    SSE_test = 0;
    for j = 1:Kfold
        test_index = find(indices ==j);
        train_index = find(indices ~=j);
        [MSE_train, MSE_test] = ridgeSolver(x_train(train_index,:), y_train(train_index,:), x_train(test_index, :), y_train(test_index, :), lamda(i));
        test_size = length(test_index);
        %SSE_test = SSE_test + test_size* ;
        SSE_test = SSE_test + MSE_test;
    end
    CV(i,1) = lamda(i);
    %CV(i,2) = SSE_test/num_observe ;
    CV(i,2) = SSE_test/Kfold ;
end
end

