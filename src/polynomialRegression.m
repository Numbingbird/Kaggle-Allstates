function w = polynomialRegression(K,x,y)
% Return: a (K+1)x1 weight vector w where the
% estimated model function is f(x) = \sum_{i=0}^{K} w(i) x^i.

X = [ones(size(x))];
for i = 1:K
    X = [X x.^i];
end
w = X\y;
end