load('diabetes.mat');
x_test = [ones(length(y_test),1),x_test];
x_train = [ones(length(y_train),1),x_train];
%calculate MSE train and MSE test
lamda = [1*10^(-5) 1*10^(-4) 1*10^(-3) 1*10^(-2) 1*10^(-1) 1 10 ];
L=length(lamda);
MSE_lamda_train=zeros(L,2);
MSE_lamda_test =zeros(L,2);

for i= 1: L
    MSE_lamda_train(i,1) = lamda(i);
    MSE_lamda_test(i,1) = lamda(i);
    [MSE_lamda_train(i,2), MSE_lamda_test(i,2)] = ridgeSolver (x_train, y_train, x_test, y_test, lamda(i));
end
figure();
plot(log10(MSE_lamda_train(:,1)), MSE_lamda_train(:,2), 'b--*');
hold on 
plot(log10(MSE_lamda_test(:,1)), MSE_lamda_test(:,2), 'r-->');
%5_fold cross validation using training data and plot
Kfold = 5;
CV = cross_valid(x_train, y_train, 5,lamda);
plot(log10(CV(:,1)), CV(:,2), 'g--o');
xlabel('log10(lamda)');
ylabel('MSE');
legend('MSE train', 'MSE test', '5 fold CV');
title('Comparison of MSE train, MSE test and 5 fold Cross Validation');
min_CV = min(CV(:,2));
[best_lamda_index, min_CV_index] = find(CV==min_CV);
best_lamda = CV(best_lamda_index,1)
