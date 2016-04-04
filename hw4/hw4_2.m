%upload the data file
load('ad_data.mat');
%define the vector of regularization parameter par of logistic regression
par = [1e-8 0.01 0.02 0.05 0.1 0.2];
%initial output: numNonZeroFeature, accuracy
%initial count of correct prediction
count = zeros(size(par));
numNonZeroFeature = zeros(size(par));
accuracy = zeros(size(par));
%define train_data, test_data, train_label, test_label
train_data = X_train;
train_label = y_train;
test_data = X_test;
test_label = y_test;
%add constant 1 to the last column of the test_data
num_x_test = size(test_data,1);
constant_test = ones(num_x_test,1);
test_data = [test_data, constant_test];
num_label = length(test_label);

for i = 1:length(par)
    %logistic regression with regularization parameter
    [w,c] = logistic_l1_train(train_data,train_label, par(i));
    weight = [w;c];
    %predict using the resulted weight from logistic regression      
    pred = 1.0 ./(1.0+exp(-test_data * weight));
    %convert the predict to 1 or 1 based on the threshold 0.5
    for j = 1:num_label
       if pred(j) >= 0.5
           pred(j) = 1;
       else
           pred(j) = -1;
       end
       if pred(j) == test_label(j)
          count(i) = count(i) + 1;
       end
    end
    %output: numNonZeroFeature and accuracy of the prediction
    numNonZeroFeature(i) = sum(weight~=0);
    accuracy(i) =  count(i) / num_label;
    
end


plot(par,accuracy, 'b*');
xlabel('lamda');
ylabel('accuracy');
title('Accuracy of prediction vs lamda');
hold on
figure();
plot(par,numNonZeroFeature, 'r<');
xlabel('lamda');
ylabel('numNonZeroFeature');
title('numNonZeroFeature vs lamda');



