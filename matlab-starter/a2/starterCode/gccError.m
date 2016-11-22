function error = gccError(c1_train, c2_train, c1_test, c2_test, testfile);
% Calculate error on a dataset.
% For consistency with starter code, one entry per row (on all inputs)
[p1, m1, m2, C1, C2] = learnGCCmodel(c1_train, c2_train);

% calculating performance
correctCount = 0;

wrong = zeros(1, size(c1_test,2));
correct = zeros(1, size(c1_test,2));
for i = 1:size(c1_test,1)
	s = gccClassify(c1_test(i,:), p1, m1, m2, C1, C2);
	if isequal(1, s)
		correctCount = correctCount + 1;
		correct = [correct;c1_test(i,:)];
	elseif isequal(0,s)
		disp(sprintf('unexpected: sign was 0 for class1 entry %d', i));
	else
		wrong = [wrong;c1_test(i,:)];
	end
end


for i = 1:size(c2_test,1)
	s = gccClassify(c2_test(i,:), p1, m1, m2, C1, C2);
	if isequal(-1, s)
		correctCount = correctCount + 1;
		correct = [correct;c2_test(i,:)];
	elseif isequal(0,s)
		disp(sprintf('unexpected: sign was 0 for class2 entry %d', i));
	else
		wrong = [wrong;c2_test(i,:)];
	end
end
correct = correct(2:end,:);
wrong = wrong(2:end,:);

figure(1);clf;
hold on;
plot(c1_train(:,1), c1_train(:,2), 'k*');
plot(c2_train(:,1), c2_train(:,2), 'b*');
plot(correct(:,1), correct(:,2), 'go');
if not(isempty(wrong))
	plot(wrong(:,1), wrong(:,2), 'rx');
end
xlabel('x');
ylabel('y');
legend('c1train', 'c2train', 'correct', 'incorrect');
title(['GCC on ', testfile]);
print('-f1',['GCC on ',testfile],'-painters','-r100','-dpng')

error = 1 - (correctCount/(size(c1_test,1) + size(c2_test,1)));
%}