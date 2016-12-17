% remember to load before running, regLoad. Loading takes a while.
% generate graphs of K error for human choice of K.

% constants
MAX_K = 15;

[X_train, Y_train, X_test, Y_test] = partition(train,trainY,size(trainY,1)/10);

kvals = ones(MAX_K, size(X_train,2));
for i = 1:size(X_train,2)
	kvals(:,i) = multiFit(MAX_K, X_train(:,i),Y_train,X_test(:,i),Y_test);
	
	figure('Visible','off');clf;
	hold on;
	plot([1:MAX_K],kvals(:,i),'rx');

	title(['Errors on dimension ',num2str(i)]);
	xlabel('K');
	ylabel('error');

	%-r100 used to increase font size. -painters allows usage of -r100.
	print('-f',['Errors on dimension ',num2str(i)],'-painters','-r100','-dpng')
end

kvals

% ~ ignores first output. interested in lowest value of k.
% [~,e] = min(e);


