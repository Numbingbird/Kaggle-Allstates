% Use the function learnGCCmodel to learn a Gaussian Class-Conditional
% model for classification.
% Use the function gccClassify for evaluating the decision function
% to perform classification.
% Then test the model under various conditions.
% gccError does the plotting.

% learnGCCmodel takes one exemplar per row.
load('../dataSets/generic1');
disp(sprintf('gcc generic1 loss: %d', ...
	gccError(c1_train', c2_train', c1_test', c2_test', 'generic1')));

load('../dataSets/generic2');
disp(sprintf('gcc generic2 loss: %d', ...
	gccError(c1_train', c2_train', c1_test', c2_test', 'generic2')));

%%%%%%%%%
% dataset fruit. Needs a bit of formatting.
load('../dataSets/fruit_train');
load('../dataSets/fruit_test');

% formatting.
% learnGCCmodel takes one exemplar per row.
[c1_train, c2_train] = split(inputs_train', target_train');
[c1_test, c2_test] = split(inputs_test', target_test');

disp(sprintf('gcc fruit loss: %d', ...
	gccError(c1_train, c2_train, c1_test, c2_test, 'fruit')));


%%%%%%%%%
% dataset mnist (digits)
% mnist is a special case. If we try to calculate covariance,
% we will get a singular matrix. This is because a sample covariance
% matrix is singular when sample sizes < number of variables.
% since digits has 60 samples and 786 variables, this means covariance
% is singular and cannot be inversed.

%{
disp(sprintf('gcc mnist loss: %d', ...
	 gccError(c1_train, c2_train, c1_test, c2_test)));
%}