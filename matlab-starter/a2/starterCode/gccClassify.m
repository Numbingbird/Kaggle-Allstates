
function class = gccClassify(x, p1, m1, m2, C1, C2)
% 
% Inputs
%   x - test examplar. 
%		For consistency with format of other functions, input as row vector.
%   p1 - prior probability for class 1
%   m1 - mean of Gaussian measurement likelihood for class 1
%   m2 - mean of Gaussian measurement likelihood for class 2
%   C1 - covariance of Gaussian measurement likelihood for class 1
%   C2 - covariance of Gaussian measurement likelihood for class 2
%
% Outputs
%   class - sgn(a(x)) (ie sign of decision function a(x))

% a(x)=-1/2ln⁡|Σ_1|  -1/2(xu_1 )^T Σ_1^(-1) (x-u_1 ) 
%		+1/2ln⁡|Σ_2|  +1/2(x-u_2 )^T Σ_2^(-1)(x-u_2 )  +cst

a = -((1/2) * log(det(C1))) - ( (1/2) * (x-m1) * inv(C1) * (x-m1)' ) + ...
	((1/2) * log(det(C2))) + ( (1/2) * (x-m2) * inv(C2) * (x-m2)' );

class = sign(a);