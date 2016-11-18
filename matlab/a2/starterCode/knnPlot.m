function error = knnPlot(k, inputs_train, target_train, correct, wrong, testfile);
% Plot results

figure(1);clf;
hold on;
[c1_train, c2_train] = split(inputs_train, target_train);
plot(c1_train(:,1), c1_train(:,2), 'k*');
plot(c2_train(:,1), c2_train(:,2), 'b*');
plot(correct(:,1), correct(:,2), 'go');
if not(isempty(wrong))
	plot(wrong(:,1), wrong(:,2), 'rx');
end
xlabel('x');
ylabel('y');
legend('c1train', 'c2train', 'correct', 'incorrect');
title(['KNN = ', num2str(k), ' on ', testfile]);
print('-f1',['KNN = ', num2str(k), ' on ', testfile],'-painters','-r100','-dpng')
