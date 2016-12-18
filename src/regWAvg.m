function Y_model = regWAvg(K, W, X_train, Y_train, X_test, Y_test)
% calculate the weighted average with given Ks
% run regression on each individual dimension and combine their predictions with weight

Y_model = zeros(size(Y_test,1),1);

for i = 1:size(X_train,2)
	disp(i);
	% Step 1
   B = polynomialRegression(K(i),X_train(:,i),Y_train);

	% a (K+1)x1 weight vector w where the
	% estimated model function is f(x) = \sum_{i=0}^{K} w(i) x^i.
	w = B\Y_train;

   % Step 2
   Y_model = Y_model + (evalPolynomial(K(i),X_test(:,i),w) * W(i));
end
