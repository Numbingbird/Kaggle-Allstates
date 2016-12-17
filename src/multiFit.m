function e = multiFit(K,xTrain,yTrain,x,y)
% Function for many calls to fitModel
% K is the polynomial degree that you want to go up to, from 1.
% xTrain,yTrain is the training data,
% and x,y is the data to calculate error for.
% return best fit k.

% Not a script, as I wanted to apply the same function to testing data as well.
% Simply put, use fitModel(K,x,y,x,y) for training data
% and fitModel(K,x,y,xTest,yTest) for testing data.

   % Preload error matrix
   e = ones(K,1);
   for k = 1:K
	  % replace fitModel with fitModelPlot to generate K plots
      e(k) = fitModel(k,xTrain,yTrain,x,y);
   end
   

end