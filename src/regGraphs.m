% remember to load before running, regLoad. Loading takes a while.
% generate graphs of K error for human choice of K.
% run this however many times you want to see different partitions.

% constants
MAX_K = 15;
PARTITION_SIZE = size(trainY,1)/10;  % elements in verification set

[X_train, Y_train, X_test, Y_test] = partition(train,trainY,PARTITION_SIZE);

evals = ones(MAX_K, size(X_train,2));
for i = 1:size(X_train,2)
	evals(:,i) = multiFit(MAX_K, X_train(:,i),Y_train,X_test(:,i),Y_test);
	
	figure('Visible','off');clf;
	hold on;
	plot([1:MAX_K],evals(:,i),'rx');

	title(['Errors on dimension ',num2str(i)]);
	xlabel('K');
	ylabel('error');

	%-r100 used to increase font size. -painters allows usage of -r100.
	print('-f',['Errors on dimension ',num2str(i)],'-painters','-r100','-dpng')
end

% see the errors.
% evals

% first output errors. second output k values.
[e,k] = min(evals)


