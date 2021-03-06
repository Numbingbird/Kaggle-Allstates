function e = fitModel(K,xTrain,yTrain,x,y)
% Function for section "Fit Models" of CSCC11 A1
% xTrain,yTrain is the training data,
% and x,y is the data to calculate error for.

% Not a script, as I wanted to apply the same function to testing data as well.
% Simply put, use fitModel(K,x,y,x,y) for training data
% and fitModel(K,x,y,xTest,yTest) for testing data.

   % Step 1
   B = polynomialRegression(K,xTrain,yTrain);

	% a (K+1)x1 weight vector w where the
	% estimated model function is f(x) = \sum_{i=0}^{K} w(i) x^i.
	w = B\yTrain;

   % Step 2
   yModel = evalPolynomial(K,x,w);
   e = sum(abs(y-yModel));  % residual error

end