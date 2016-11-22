function error = knnLossPlot(inputs_train, target_train, inputs_test, target_test, testfile);
% Plot loss as function of k

k = [3:2:12];
loss = zeros(size(k));
for i = 1:numel(k)
	loss(i) = knnError(k(i), inputs_train, target_train, inputs_test, target_test);
end
figure(1);clf;
hold on;
plot(k, loss, 'r*');
xlabel('k');
ylabel('loss');
title(['KNN losses on ', testfile]);
print('-f1',['KNN losses on ', testfile], '-painters','-r100','-dpng');