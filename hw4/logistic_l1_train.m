function [ w,c ] = logistic_l1_train( data, labels, par )
% output: w is equivalent to the first d dimension of weights in
% logistic.train
%         c is the bias term, equivalent to the last dimension in weights
%         in logistic.train

opts.rFlag = 1;
opts.tol = 1e-6;
opts.tFlag = 4;
opts.maxIter = 5000;

[w,c] = LogisticR(data, labels, par, opts);

end

