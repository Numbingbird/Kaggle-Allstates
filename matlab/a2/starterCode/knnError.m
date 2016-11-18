function [error, correct, wrong] = knnError(k, inputs_train, target_train, inputs_test, target_test, testfile);

% Calculate error on a dataset.
% For consistency with starter code, one entry per row (on all inputs)

% since given data fruits have identity vector per column,
% 	need to transpose into vector per row
classOut = zeros(size(target_test));
% outputs from knnClassify are row vectors, transposed for comparison with targets
for i = 1:size(inputs_test, 1)
	classOut(i,:) = knnClassify([inputs_test(i,:)], k, inputs_train, target_train);
end

% calculating performance
correctCount = 0;
wrong = zeros(1, size(inputs_test,2));
correct = zeros(1, size(inputs_test,2));
for i = 1:size(classOut, 1)
	if isequal(classOut(i,:),target_test(i,:))
		correctCount = correctCount + 1;
		correct = [correct;inputs_test(i,:)];
	else
		wrong = [wrong;inputs_test(i,:)];
	end
end
correct = correct(2:end,:);
wrong = wrong(2:end,:);

error = 1 - (correctCount/size(target_test,1));
