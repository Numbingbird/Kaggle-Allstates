% remember to load before running, regLoad. Loading takes a while.
% usage:
% k = [4;2;3;3;6;4;2;2;6;4;3;3;3;2]

% initialize random weights
W = abs(randn(size(X_train,2),1));

% constants
K = [4;2;3;3;6;4;2;2;6;4;3;3;3;2];
%W = [3.67;3.66;3.69;3.7;3.7;3.7;3.7;3.7;3.7;3.7;3.7;3.7;3.7;3.685];	% or set weights yourself

% sum to 1
W = W/sum(W); 


PARTITION_SIZE = size(trainY,1)/10;  % elements in verification set
[X_train, Y_train, X_test, Y_test] = partition(train,trainY,PARTITION_SIZE);

% calculate error
e = Y_test - regWAvg(K, W, X_train, Y_train, X_test, Y_test);
W
sum(abs(e))
