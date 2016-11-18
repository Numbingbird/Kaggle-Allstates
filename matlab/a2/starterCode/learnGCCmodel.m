function [p1, m1, m2, C1, C2] = learnGCCmodel(x1, x2)
% 
% Inputs
%   x1 - training exemplars from class 1, one exemplar per row
%   x2 - training exemplars from class 2, one exemplar per row
%
% Outputs
%   p1 - prior probability for class 1
%   m1 - mean of Gaussian measurement likelihood for class 1
%   m2 - mean of Gaussian measurement likelihood for class 2
%   C1 - covariance of Gaussian measurement likelihood for class 1
%   C2 - covariance of Gaussian measurement likelihood for class 2
%

p1 = size(x1,1)/(size(x1,1) + size(x2,1));

m1 = zeros(1,size(x1,2));
for i = 1:size(x1,1)
	m1 = m1 + x1(i,:);
end
m1 = m1./size(x1,1);

% an issue appears if there are repeated mean values, causing covariance to be 

m2 = zeros(1,size(x2,2));
for i = 1:size(x2,1)
	m2 = m2 + x2(i,:);
end
m2 = m2./size(x2,1);

% covariance calculated with 1/N instead of 1/(N-1)
C1 = zeros(size(x1,2));
for i = 1:size(x1,1)
	% since the vectors are rows, this operation makes column * row, as desired
	xi = (x1(i,:)-m1);
	C1 = C1 + (xi'*xi);
end
C1 = C1./size(x1,1);

C2 = zeros(size(x2,2));
for i = 1:size(x2,1)
	% since the vectors are rows, this operation makes column * row, as desired
	xi = (x2(i,:)-m2);
	C2 = C2 + (xi'*xi);
end
C2 = C2./size(x2,1);
