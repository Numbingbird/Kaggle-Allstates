% remember to load before running, regLoad. Loading takes a while.

% constants
MAX_K = 15;

[X_train, Y_train, X_test, Y_test] = partition(train,trainY,size(trainY,1)/10);

kvals = ones(size(X_train,2),1);
for i = 1:numel(kvals)
	kvals(i) = multiFit(MAX_K, X_train(:,i),Y_train,X_test(:,i),Y_test);
end

kvals