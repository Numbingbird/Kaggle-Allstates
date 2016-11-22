% Use learnLogReg() to test performance on various datasets.
% logistic functions, other than logistic.m, take one exemplar per row.

alpha = 0.25;

load('../dataSets/generic1');
inputs_test = [c1_test c2_test];
target_test = [ones(1,size(c1_test,2)) zeros(1,size(c2_test,2));
	zeros(1,size(c1_test,2)) ones(1,size(c2_test,2))];
t = logisticError(c1_train, c2_train, inputs_test, target_test, alpha)
%disp(sprintf('logistic generic1 loss: %d', t)));
figure(1);clf;
hold on;

plot(inputs_test(:,1:69), t(:,1:69), 'k*');
plot(inputs_test(:,70:end), t(:,70:end), 'b*');
