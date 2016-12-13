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
   
   

   % Step 3
   figure(1);clf;
   hold on;
   plot(x,y,'k*');
   
   % x is overwritten and reused
   x = [-2.2:0.1:2.2];
   plot(x,evalPolynomial(K,x',w));

   title(['Fit on test data with K = ',num2str(K), ...
       '. Black asterisks is raw input, blue line is fit model. ', ...
       'Residual error is ',num2str(e),'.']);
   xlabel('x');
   ylabel('y');

   %-r100 used to increase font size. -painters allows usage of -r100.
   print('-f1',['Fit on test data with K = ',num2str(K)],'-painters','-r100','-dpng')
   
   %Text placeholders:
   %'Fit model with
   %'Fit on test data with
end