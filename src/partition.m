function [X_train, Y_train, X_test, Y_test] = partition(X,Y,split_point)
% split up input data into learning and validation sets.
% data is expected to be one entry per row.
% third argument is number of entries to be taken out as validation set.
% sample usage: 
% [X_train, Y_train, X_test, Y_test] = partition(X,Y,90)


%mnew = a(randperm(size(a, 1), 1000);

% taken from stack overflow
num_points = size(X,1);
split_point = num_points - split_point;  % or set splitpoint yourself
seq = randperm(num_points);
X_train = X(seq(1:split_point),:);
Y_train = Y(seq(1:split_point));
X_test = X(seq(split_point+1:end),:);
Y_test = Y(seq(split_point+1:end));