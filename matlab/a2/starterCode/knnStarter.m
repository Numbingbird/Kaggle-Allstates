% Use the function knnClassify to test performance on different datasets.

% choice of k for instance
k = 3;

% individual plots on datasets done by knnPlot. errors vs k done by knnLossPlot.

% dataset generic1
% operations are formatting for input into classification
load('../dataSets/generic1');
genOut = zeros(size(c1_train,1), size(c1_train, 2) + size(c2_train,2));
inputs_train = [c1_train c2_train];
inputs_test = [c1_test c2_test];
target_train = [ones(1,size(c1_train,2)) zeros(1,size(c2_train,2));
	zeros(1,size(c1_train,2)) ones(1,size(c2_train,2))];
target_test = [ones(1,size(c1_test,2)) zeros(1,size(c2_test,2));
	zeros(1,size(c1_test,2)) ones(1,size(c2_test,2))];

[error, correct, wrong] = knnError(k, inputs_train', target_train', inputs_test', target_test', 'generic1');
disp(sprintf('knn generic1 loss with k=%d : %d', k,	error));
knnPlot(k, inputs_train', target_train', correct, wrong, 'generic1');
knnLossPlot(inputs_train', target_train', inputs_test', target_test', 'generic1');


%%%%%%%%%
% dataset generic2
% operations are identical to generic1.
filename = 'generic2';
load(strcat('../dataSets/', filename));
genOut = zeros(size(c1_train,1), size(c1_train, 2) + size(c2_train,2));
inputs_train = [c1_train c2_train];
inputs_test = [c1_test c2_test];
target_train = [ones(1,size(c1_train,2)) zeros(1,size(c2_train,2));
	zeros(1,size(c1_train,2)) ones(1,size(c2_train,2))];
target_test = [ones(1,size(c1_test,2)) zeros(1,size(c2_test,2));
	zeros(1,size(c1_test,2)) ones(1,size(c2_test,2))];
	
[error, correct, wrong] = knnError(k, inputs_train', target_train', inputs_test', target_test', filename);
disp(sprintf('knn %s loss with k=%d : %d', filename, k, error));
knnPlot(k, inputs_train', target_train', correct, wrong, filename);
knnLossPlot(inputs_train', target_train', inputs_test', target_test', filename);

%%%%%%%%%
% dataset fruit
load('../dataSets/fruit_train');
load('../dataSets/fruit_test');
filename = 'fruit';
[error, correct, wrong] = knnError(k, inputs_train', target_train', inputs_test', target_test', filename);
disp(sprintf('knn %s loss with k=%d : %d', filename, k, error));
knnPlot(k, inputs_train', target_train', correct, wrong, filename);
knnLossPlot(inputs_train', target_train', inputs_test', target_test', filename);


%%%%%%%%%
% dataset mnist (digits)
% the format of fruit is similar to mnist, difference handled by knnClassify
load('../dataSets/mnist_train');
load('../dataSets/mnist_test');
filename = 'digits';
[error, correct, wrong] = knnError(k, inputs_train', target_train', inputs_test', target_test', filename);
disp(sprintf('knn %s loss with k=%d : %d', filename, k, error));
knnPlot(k, inputs_train', target_train', correct, wrong, filename);
knnLossPlot(inputs_train', target_train', inputs_test', target_test', filename);

%}