function sig = sigma(wi,xi,b)
% sigma calculation for logistic regression
% Inputs
%   wi - weight vector, row/col both work
%   xi - single data vector, row/col both work
%	b - bias
%
% Outputs
%   sig - output of sigma function
% 	σ(z)=1/(1+exp⁡(-z) )
%

%  a function to reduce duplicate operations.

% making the function easy to work with.
% ensure w is a row vector.
if iscolumn(wi)
	w = wi';
else
	w = wi;
end
% ensure x is a column vector.
if iscolumn(xi)
	x = xi;
else
	x = xi';
end
sig = 1/(1 + exp(-((w * x) + b)));