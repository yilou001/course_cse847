function weights = logistic_train(data,labels,epsilon,maxiter)
%input: data,labels,epsilon,maxiter
%output: weights of logistic regression without regularization of model
%complexity
    if(~exist('espilon','var'))
        epsilon = 1e-5;
    end
    if(~exist('maxiter','var'))
        maxiter = 1000;
    end
    count = 0;
    num_exp_var = size(data,2);
    initial_w = zeros(num_exp_var,1);
    current_w = initial_w;
    current_epsilon = inf;
    while( count < maxiter && current_epsilon > epsilon)
        count = count + 1;
        prev_w = current_w;
        p = 1 ./ (1+exp(-data * current_w));
        H = data' * diag(p.*(1-p)) * data;
        delta = data' * (p - labels);
        %update w
        current_w = prev_w - 0.5* inv(H) * delta;
        current_epsilon = norm(current_w - prev_w);
    end
    weights = current_w;
end