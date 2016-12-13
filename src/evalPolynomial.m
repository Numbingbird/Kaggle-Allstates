function y = evalPolynomial(K,x,w)
% Evaluate the polynomial defined by the given weight vector at the
% given values of x.
% Rewritten from ground up for project

% b is folded into w [w1..wd,b]

% recalculate basis on test set
B = [ones(size(x))];
for i = 1:K
    B = [B x.^i];
end

y = w' * B';
y = y';