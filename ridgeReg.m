function [ W ] = ridgeReg( X, Y, lamda )
%input: matrix X, response Y, individual lamda
%output: coefficient W from redge regression
[n, p] = size(X);
I = eye(p);
W = (X'*X + lamda*I)\X'*Y;
end

