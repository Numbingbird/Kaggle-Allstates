function multiFit(K,xTrain,yTrain,x,y)
% Function for many calls to fitModel
% K is the polynomial degree that you want to go up to, from 1.
% xTrain,yTrain is the training data,
% and x,y is the data to calculate error for.

% Not a script, as I wanted to apply the same function to testing data as well.
% Simply put, use fitModel(K,x,y,x,y) for training data
% and fitModel(K,x,y,xTest,yTest) for testing data.

   % Preload error matrix
   e = ones([K 1]);
   for k = 1:K
      e(k) = fitModel(k,xTrain,yTrain,x,y);
   end

   figure(2);clf;
   hold on;
   % k is overwritten and reused
   k = [1:1:K];
   plot(k,e,'rx');

   title('Errors on test data. Red crosses are residual errors.');
   xlabel('K');
   ylabel('error');

   %-r100 used to increase font size. -painters allows usage of -r100.
   print('-f2','Errors on test data','-painters','-r100','-dpng')
   
   %Text placeholders:
   %'Error values
   %'Errors on test data
end