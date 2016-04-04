%upload the files. Input: data, label
data = textread('data.txt');
label= textread('labels.txt');
%add constant 1 at the last column of the train_data and test_data
num_x = size(data, 1);
m = size(data,2);
constant = ones(num_x,1);
data = [data,constant];
%define test_data
test_data = data(2001:end,:);
%initial output: # of train_data and accuracy 
n = [200, 500, 800, 1000, 1500, 2000];
count = zeros(size(n));
accuracy = zeros(size(n));

for i = 1:length(n)
    %define train_data and train_label
    train_data = data(1:n(i),:);
    train_label = label(1:n(i));
    %logistic regression
    weights = logistic_train(train_data,train_label);
    %define test_data and test_label
    test_label = label(2001:end);
    num_label = length(test_label);
    %predict using resulted weights from logistic regression
    pred = 1.0 ./(1.0+exp(-test_data * weights));
    %convert prediction to 0 or 1 using threshold 0.5
    for j = 1:num_label
        if pred(j) >= 0.5
           pred(j) = 1;
        else
           pred(j) = 0;
        end
    end
    %count the number of the correct predictions
    for k = 1:num_label
        if pred(k) == test_label(k)
            count(i) = count(i) + 1;
        end
    end
    %output: accuracy of the prediction   
    accuracy(i) =  count(i) / num_label; 
    
end

plot(n,accuracy, 'b*');
xlabel('# of training data');
ylabel('accuracy');
title('Accuracy of prediction vs # of training data');

    



