function [ll, dll_dw, dll_db] = logisticNLP(x1, x2, wi, b, alpha)
% [ll, dll_dw, dll_db] = logisticNLP(x1, x2, w, b, alpha)
% 
% Inputs:
%   x1 - array of exemplar measurement vectors for class 1,  one exemplar per col
%   x2 - array of exemplar measurement vectors for class 2,  one exemplar per col
%   wi - an array of weights for the logistic regression model. can be row or col
%   b - the bias parameter for the logistic regression model.
%   alpha - weight decay parameter
% Outputs:
%   ll - negative log probability (likelihood) for the data 
%        conditioned on the model (ie w).
%   dll_dw - gradient of negative log data likelihood wrt w
%   dll_db - gradient of negative log data likelihood wrt b

% ensure the wi is a col vector.
% Transfer data into another variable so as not to change input.
if iscolumn(wi)
	w = wi;
else
	w = wi';
end

% ll = regularizer - class 1 - class 2
ll = ((size(w,1)/2) * log(2 * pi * alpha)) + ((w'*w) / (2*alpha));
for i = 1:size(x1,2)
	ll = ll - log(1 - sigma(w,x1(:,i),b));
end
for i = 1:size(x2,2)
	ll = ll - log(sigma(w,x2(:,i),b));
end

dll_dw = zeros(size(x1,1),1);
for i = 1:size(x1,2)
	dll_dw = dll_dw  + ((sigma(w,x1(:,i),b)) * x1(:,i));
end
for i = 1:size(x2,2)
	dll_dw = dll_dw  - ((1 - sigma(w,x2(:,i),b)) * x2(:,i));
end

dll_db = 0;
for i = 1:size(x1,2)
	dll_db = dll_db  + ((sigma(w,x1(:,i),b)) * (w' * x1(:,i)));
end
for i = 1:size(x2,2)
	dll_db = dll_db  - ((1 - sigma(w,x2(:,i),b)) * (w' * x2(:,i)));
end
