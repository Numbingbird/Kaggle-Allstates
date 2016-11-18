function error = logisticError(c1_train, c2_train, inputs_test, target_test, alpha);
% Calculate 1-0 error of logistic regression
% one entry per col (on all inputs)
[w,b] = learnLogReg(c1_train,c2_train,alpha);
p = logistic(inputs_test, w, b);
error = p;

% calculating performance
correctCount = 0;
%{
[c1_test, c2_test] = split(inputs_test, target_test);
for i = 1:size(c1_test,1)
	if isequal(1, s)
		correctCount = correctCount + 1;
	elseif isequal(0,s)
	end
end

for i = 1:size(c2_test,1)
	if isequal(-1, s)
		correctCount = correctCount + 1;
	elseif isequal(0,s)
	end
end

test_cases = size(c1_test,1) + size(c2_test,1);
error = (test_cases-correctCount)/test_cases;
%}