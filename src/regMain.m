% remember to load before running, regLoad. Loading takes a while.
% can load src\edata.mat for example W,K

%W = abs(randn(size(X_train,2),1)); % initialize random weights
%W = abs([3.67;3.66;3.69;3.7;3.7;3.7;3.7;3.7;3.7;3.7;3.7;3.7;3.7;3.685]-4);	% or set weights yourself
% or comment them both out to use the one in workspace

% sum to 1. not optional.
W = W/sum(W); 

%set your K or leave it alone to use the one in workspace by commenting this out
%K = [4;2;3;3;6;4;2;2;6;4;3;3;3;2];
% 

W
K

PARTITION_SIZE = size(trainY,1)/10;  % elements in verification set
[X_train, Y_train, X_test, Y_test] = partition(train,trainY,PARTITION_SIZE); % change your dataset

% calculate error
e = Y_test - regWAvg(K, W, X_train, Y_train, X_test, Y_test);
sum(abs(e))
